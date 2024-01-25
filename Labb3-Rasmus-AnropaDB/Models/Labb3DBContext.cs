using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Labb3_Rasmus_AnropaDB.Models;

public partial class Labb3DBContext : DbContext
{
    public Labb3DBContext()
    {
    }

    public Labb3DBContext(DbContextOptions<Labb3DBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBetyg> TblBetygs { get; set; }

    public virtual DbSet<TblKur> TblKurs { get; set; }

    public virtual DbSet<TblPersonal> TblPersonals { get; set; }

    public virtual DbSet<TblStudent> TblStudents { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data source = RASMUS-LAPTOP;Initial Catalog = Labb2_Rasmus;Integrated Security=True;TrustServerCertificate = Yes");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBetyg>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tblBetyg");

            entity.Property(e => e.Betyg)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.KursId).HasColumnName("KursID");
            entity.Property(e => e.PersonalId).HasColumnName("PersonalID");
            entity.Property(e => e.StudentId).HasColumnName("StudentID");

            entity.HasOne(d => d.Kurs).WithMany()
                .HasForeignKey(d => d.KursId)
                .HasConstraintName("tblBetyg_KursID_FK");

            entity.HasOne(d => d.Personal).WithMany()
                .HasForeignKey(d => d.PersonalId)
                .HasConstraintName("tblBetyg_PersonalID_FK");

            entity.HasOne(d => d.Student).WithMany()
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("tblBetyg_StudentID_FK");
        });

        modelBuilder.Entity<TblKur>(entity =>
        {
            entity.HasKey(e => e.KursId).HasName("PK__tblKurs__BCCFFF3B9915B108");

            entity.ToTable("tblKurs");

            entity.Property(e => e.KursId).HasColumnName("KursID");
            entity.Property(e => e.KursNamn)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TblPersonal>(entity =>
        {
            entity.HasKey(e => e.PersonalId).HasName("PK__tblPerso__28343713D1BDB47D");

            entity.ToTable("tblPersonal");

            entity.Property(e => e.PersonalId).HasColumnName("PersonalID");
            entity.Property(e => e.Befattning)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TblStudent>(entity =>
        {
            entity.HasKey(e => e.StudentId).HasName("PK__tblStude__32C52A793A19FAEC");

            entity.ToTable("tblStudent");

            entity.Property(e => e.StudentId).HasColumnName("StudentID");
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Klass)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Personnr)
                .HasMaxLength(13)
                .IsFixedLength();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
