# School Management System — Cross-Platform Complete Build

A single full-stack school platform for admissions, student records, academics, attendance, fees, receipts, report cards, cumulative transcripts, online lessons/tests, activities, announcements and role-based school management.

## Supported platforms

The same responsive PWA works on:

- **iPhone/iPad:** Safari → Share → Add to Home Screen
- **Android:** Chrome → Install app / Add to Home screen
- **Windows laptop/desktop:** Chrome or Edge → Install app
- **Chromebook:** Chrome → Install app
- **Mac/Linux:** Chrome/Edge can also install it as a PWA
- **Server:** Windows, Linux, Docker or a cloud VM

No separate frontend codebase is required.

## Roles

OWNER, ADMIN, HEADTEACHER, CLASS_TEACHER, SUBJECT_TEACHER, BURSAR, STUDENT, PARENT.

The Owner is intended for initial system setup and recovery. The school should create permanent operational accounts after setup and change their passwords.

## Included modules

### School management
- First-run protected Owner setup
- School name, logo, motto and academic-year settings
- Term settings
- Dashboard
- Role-based permissions
- User management
- Audit trail
- Password changes
- Database backup

### Admissions & students
- Student admission
- Admission number
- Unique student index number
- Class allocation
- Guardian details
- Previous-school information
- Student status
- Search by name, index or admission number

### Academics
- Classes
- Subjects
- Class/subject records
- Class and examination scores
- Automatic total and Ghana-style A1–F9 grade bands
- Attendance
- Academic-year and term records
- Cumulative academic history

### Reports
- Term report-card generation
- Printable reports
- Cumulative transcript generation
- Fee/levy clearance blocking for reports and transcripts

### Finance
- Fees and levies
- Fee items by academic year and term
- Student payment records
- Receipt numbers
- Printable receipts
- Cash, MoMo, bank and cheque methods
- Outstanding balances

### E-learning
- Lessons
- Video links
- Lesson attachments/links
- Online tests
- Automatic objective test marking
- Student index-number tracking

### School programmes
- Activities
- School announcements
- Timetable-ready database structure

## Offline/PWA

The frontend is installable and caches the application shell for use when connectivity is poor or temporarily unavailable. Previously loaded pages can remain available offline. Server-backed database writes require a connection unless an operation is specifically supported by the sync layer.

## Local Windows setup

1. Install Node.js 20 or newer.
2. Extract this folder.
3. Double-click `install-windows.bat`.
4. The script installs dependencies, creates `.env`, starts the server and opens the browser.
5. Open `http://localhost:3000` if the browser does not open automatically.

For later launches, double-click `start-windows.bat`.

## Manual setup

```bash
npm install
npm start
```

Then open `http://localhost:3000`.

## Production server

Set:

```text
NODE_ENV=production
JWT_SECRET=<long-random-secret>
PORT=3000
```

Use HTTPS through a reverse proxy such as Nginx, Caddy or a managed cloud load balancer. Keep the `data/` directory backed up.

## Docker

Create a `.env` file containing a strong `JWT_SECRET`, then:

```bash
docker compose up -d --build
```

The SQLite database is stored in the Docker volume `school_data`.

## Backup

Owner and Administrator accounts can use **My Account → Download Database Backup**. Keep backups outside the application server as well.

## Security

- Passwords are hashed with bcrypt.
- JWT authentication is used for API sessions.
- Production requires a non-default JWT secret.
- Login attempts are throttled per IP.
- Security response headers are enabled.
- Audit records are kept for important management actions.
- Report/transcript clearance can be enforced by school management.

## Important deployment note

For a live school deployment, use HTTPS, regular off-server backups, controlled server access and a production database/server environment. The bundled SQLite database is suitable for a small-to-medium school installation; a larger multi-school deployment can migrate the same application layer to PostgreSQL.
