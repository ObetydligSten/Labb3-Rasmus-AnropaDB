using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Labb3_Rasmus_AnropaDB.Migrations
{
    /// <inheritdoc />
    public partial class Enpersontillagdipersonal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "tblKurs",
                columns: table => new
                {
                    KursID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KursNamn = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblKurs__BCCFFF3B9915B108", x => x.KursID);
                });

            migrationBuilder.CreateTable(
                name: "tblPersonal",
                columns: table => new
                {
                    PersonalID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    LastName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    Befattning = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblPerso__28343713D1BDB47D", x => x.PersonalID);
                });

            migrationBuilder.CreateTable(
                name: "tblStudent",
                columns: table => new
                {
                    StudentID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    LastName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    Personnr = table.Column<string>(type: "nchar(13)", fixedLength: true, maxLength: 13, nullable: true),
                    Klass = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblStude__32C52A793A19FAEC", x => x.StudentID);
                });

            migrationBuilder.CreateTable(
                name: "tblBetyg",
                columns: table => new
                {
                    StudentID = table.Column<int>(type: "int", nullable: true),
                    KursID = table.Column<int>(type: "int", nullable: true),
                    Betyg = table.Column<string>(type: "varchar(1)", unicode: false, maxLength: 1, nullable: true),
                    Betygsdatum = table.Column<DateOnly>(type: "date", nullable: true),
                    PersonalID = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.ForeignKey(
                        name: "tblBetyg_KursID_FK",
                        column: x => x.KursID,
                        principalTable: "tblKurs",
                        principalColumn: "KursID");
                    table.ForeignKey(
                        name: "tblBetyg_PersonalID_FK",
                        column: x => x.PersonalID,
                        principalTable: "tblPersonal",
                        principalColumn: "PersonalID");
                    table.ForeignKey(
                        name: "tblBetyg_StudentID_FK",
                        column: x => x.StudentID,
                        principalTable: "tblStudent",
                        principalColumn: "StudentID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_tblBetyg_KursID",
                table: "tblBetyg",
                column: "KursID");

            migrationBuilder.CreateIndex(
                name: "IX_tblBetyg_PersonalID",
                table: "tblBetyg",
                column: "PersonalID");

            migrationBuilder.CreateIndex(
                name: "IX_tblBetyg_StudentID",
                table: "tblBetyg",
                column: "StudentID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "tblBetyg");

            migrationBuilder.DropTable(
                name: "tblKurs");

            migrationBuilder.DropTable(
                name: "tblPersonal");

            migrationBuilder.DropTable(
                name: "tblStudent");
        }
    }
}
