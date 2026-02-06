## Project Overview

**Firma** is a Microsoft Access (VBA) business management application for the Ohnemus company. It manages addresses, articles/products, contracts (VG = Vereinbarung), projects, and related business operations. The entire codebase — UI labels, comments, variable names — is in German.

- **Database:** `firma.accdb` (Access 2016+, 32-bit)
- **Backend:** SQL Server (`OHSV-SQL01\SQL19DEV`, database `Firma`) via ODBC with Windows authentication
- **Version Control:** Rubberduck VCS v4.1.2 exports VBA source into this repository
- **Office Integration:** Word, Excel, Outlook, TAPI telephony

## Source Control Workflow

This repo contains the Rubberduck VCS export of the Access database — not the `.accdb` file itself. The export/import cycle:

- **Export:** Done via Rubberduck UI inside Access (exports modules, forms, reports, table definitions, macros as `.bas`, `.cls`, `.json` files)
- **Build/Import:** Rubberduck imports the source files back into an `.accdb`
- **Build path:** `C:\projects\`
- **Export folder:** `S:\GESCH\Access\VersionControl\`

There is no automated build, test, or lint pipeline. Testing is manual through the Access UI.

## Directory Layout

- `modules/` — VBA standard modules (`.bas`) and classes (`.cls`)
- `forms/` — Access form definitions (`.json` for layout, `.bas`/`.cls` for code-behind)
- `reports/` — Access report definitions (39 reports, `B_*` = reports, `UB_*` = subreports)
- `tbldefs/` — Table/view definitions (`T_*` = tables, `A_*` = linked SQL Server tables, `vw*` = views)
- `macros/` — `Autoexec.bas` (startup), `Autokeys.bas` (keyboard shortcuts)
- `menus/` — Custom command bar/context menu definitions and images
- `images/` — Shared images including barcodes

## Architecture

**N-Tier:** Access frontend (forms/reports/VBA) → ADODB → SQL Server backend.

### Startup Flow
`Autoexec` macro → calls `Autoexec()` in `mdl_DB.bas` → initializes database connection, authenticates user via `spI_User` stored procedure, sets global state, opens Menu form.

### Key Modules

| Module | Purpose |
|--------|---------|
| `mdl_DB.bas` | Global variables, database init, user authentication, application startup |
| `mdlADO.bas` | ADODB connection management with retry logic (6 retries, 1.2s delay) |
| `mdl_OH.bas` | General utilities (screen resolution, Windows API, file ops) |
| `mdlRibbon.bas` | Custom ribbon UI (`tlbOH`) management |
| `mdl_Outlook.bas` | Outlook email integration (`OH_OutlookMail`) |
| `mdl_Printer.bas` | Print/report handling |
| `mdlOffice.bas` | Word/Excel interop initialization |
| `mdlERechnung.bas` | ZUGFeRD electronic invoicing |
| `mdlB2B.bas` | B2B document operations |
| `mdlDMS.bas` | Document management system |
| `mdlTelefonie.bas` | TAPI/CTI telephony integration |

### Core Database Functions (mdlADO.bas)

- `OH_r()` — Universal recordset opener with connection retry logic. Accepts optional recordset, SQL, cursor type, lock type. Falls back to global `strSQL` if no SQL provided.
- `OH_EX()` — Command executor for non-query SQL
- `OH_A()` — Parameterized SQL execution
- Connection errors (`-2147467259`, `3709`) trigger automatic reconnection via `OH_GetCnnString`

### Global State (mdl_DB.bas)

Extensive globals drive the application:
- **User context:** `lguser`, `strUser`, `strUserKZ`, `glAdmin`, `strRole`
- **DB connections:** `gcnn` (ADODB.Connection), `gcat` (ADOX.Catalog), `con` (in mdlADO), `db` (DAO.Database)
- **Shared recordsets:** `r`, `rs`, `rx` (ADODB.Recordset)
- **Shared SQL:** `strSQL`, `strSQL1`
- **UI state:** `f`, `frm` (Form references), `ctl` (Control reference)

### Error Handling Pattern

All modules use:
```vba
On Error GoTo ErrMsg
' ... code ...
ErrEnd:
    DoCmd.Hourglass False
    Exit Function/Sub
ErrMsg:
    Select Case Err
    ' handle specific error codes
    End Select
```

### Forms Naming Convention

- `F_*` — Main data forms (e.g., `F_Adresse`, `F_Artikel`, `F_VG`)
- `PF_*` — Popup/dialog forms (e.g., `PF_NeuVG`, `PF_Stichwort`)
- `UF_*` — Subforms

### COM References

ADODB 2.8, ADOX 2.8, DAO 12.0, MSForms, MSComctlLib, SHDocVw, MSHTML, CDO, Scripting, Office, Excel, Word, Outlook, MSXML2 6.0.
