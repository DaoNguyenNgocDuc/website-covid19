﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace webapp.Models
{
    public partial class covid19Context : DbContext
    {
        public covid19Context()
        {
        }

        public covid19Context(DbContextOptions<covid19Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<CtHoadon> CtHoadons { get; set; }
        public virtual DbSet<Danhmuc> Danhmucs { get; set; }
        public virtual DbSet<Dantoc> Dantocs { get; set; }
        public virtual DbSet<Gopy> Gopies { get; set; }
        public virtual DbSet<Hoadon> Hoadons { get; set; }
        public virtual DbSet<Hoso> Hosos { get; set; }
        public virtual DbSet<Khachhang> Khachhangs { get; set; }
        public virtual DbSet<Lienhe> Lienhes { get; set; }
        public virtual DbSet<Quoctich> Quoctiches { get; set; }
        public virtual DbSet<Sanpham> Sanphams { get; set; }
        public virtual DbSet<Tkadmin> Tkadmins { get; set; }
        public virtual DbSet<Tokhai> Tokhais { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("workstation id=covid19.mssql.somee.com;packet size=4096;user id=daoduc132_SQLLogin_1;pwd=pwh9mltyhi;data source=covid19.mssql.somee.com;persist security info=False;initial catalog=covid19");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.HasKey(e => e.Mablog)
                    .HasName("PK__BLOG__F7387DBC1663F0F0");

                entity.ToTable("BLOG");

                entity.Property(e => e.Mablog).HasColumnName("MABLOG");

                entity.Property(e => e.Anh)
                    .HasMaxLength(255)
                    .HasColumnName("ANH");

                entity.Property(e => e.Ngaydang)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("NGAYDANG");

                entity.Property(e => e.Noidung)
                    .HasMaxLength(2000)
                    .HasColumnName("NOIDUNG");

                entity.Property(e => e.Tieude)
                    .HasMaxLength(100)
                    .HasColumnName("TIEUDE");

                entity.Property(e => e.Tk)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("TK");

                entity.HasOne(d => d.TkNavigation)
                    .WithMany(p => p.Blogs)
                    .HasForeignKey(d => d.Tk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BLOG__TK__440B1D61");
            });

            modelBuilder.Entity<CtHoadon>(entity =>
            {
                entity.HasKey(e => new { e.Masp, e.Mdhd })
                    .HasName("PK__CT_HOADO__518DC7BD2571AF2E");

                entity.ToTable("CT_HOADON");

                entity.Property(e => e.Masp).HasColumnName("MASP");

                entity.Property(e => e.Mdhd).HasColumnName("MDHD");

                entity.Property(e => e.Dongia).HasColumnName("DONGIA");

                entity.Property(e => e.Soluong).HasColumnName("SOLUONG");

                entity.HasOne(d => d.MaspNavigation)
                    .WithMany(p => p.CtHoadons)
                    .HasForeignKey(d => d.Masp)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CT_HOADON__MASP__3F466844");

                entity.HasOne(d => d.MdhdNavigation)
                    .WithMany(p => p.CtHoadons)
                    .HasForeignKey(d => d.Mdhd)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CT_HOADON__MDHD__403A8C7D");
            });

            modelBuilder.Entity<Danhmuc>(entity =>
            {
                entity.HasKey(e => e.Madm)
                    .HasName("PK__DANHMUC__603F005CC93FF17E");

                entity.ToTable("DANHMUC");

                entity.Property(e => e.Madm).HasColumnName("MADM");

                entity.Property(e => e.Tendm)
                    .HasMaxLength(50)
                    .HasColumnName("TENDM");
            });

            modelBuilder.Entity<Dantoc>(entity =>
            {
                entity.HasKey(e => e.Madt)
                    .HasName("PK__DANTOC__603F005B985094AA");

                entity.ToTable("DANTOC");

                entity.Property(e => e.Madt).HasColumnName("MADT");

                entity.Property(e => e.Tendt)
                    .HasMaxLength(30)
                    .HasColumnName("TENDT");
            });

            modelBuilder.Entity<Gopy>(entity =>
            {
                entity.HasKey(e => e.Magy)
                    .HasName("PK__GOPY__603F38B2E91A9516");

                entity.ToTable("GOPY");

                entity.Property(e => e.Magy).HasColumnName("MAGY");

                entity.Property(e => e.Makh).HasColumnName("MAKH");

                entity.Property(e => e.Noidung).HasColumnName("NOIDUNG");

                entity.Property(e => e.Tieude)
                    .HasMaxLength(100)
                    .HasColumnName("TIEUDE");

                entity.Property(e => e.Tinhtrang).HasColumnName("TINHTRANG");

                entity.HasOne(d => d.MakhNavigation)
                    .WithMany(p => p.Gopies)
                    .HasForeignKey(d => d.Makh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__GOPY__MAKH__3E52440B");
            });

            modelBuilder.Entity<Hoadon>(entity =>
            {
                entity.HasKey(e => e.Mdhd)
                    .HasName("PK__HOADON__1AF4D8F233AED9E8");

                entity.ToTable("HOADON");

                entity.Property(e => e.Mdhd).HasColumnName("MDHD");

                entity.Property(e => e.Diachinhan)
                    .HasMaxLength(100)
                    .HasColumnName("DIACHINHAN");

                entity.Property(e => e.Makh).HasColumnName("MAKH");

                entity.Property(e => e.Ngaylap)
                    .HasColumnType("datetime")
                    .HasColumnName("NGAYLAP");

                entity.Property(e => e.Nguoinhan)
                    .HasMaxLength(40)
                    .HasColumnName("NGUOINHAN");

                entity.Property(e => e.Sdtnhan)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("SDTNHAN")
                    .IsFixedLength(true);

                entity.Property(e => e.Tinhtranggiaohang).HasColumnName("TINHTRANGGIAOHANG");

                entity.Property(e => e.Tinhtrangthanhtoan).HasColumnName("TINHTRANGTHANHTOAN");

                entity.Property(e => e.Tongtien)
                    .HasColumnType("money")
                    .HasColumnName("TONGTIEN");

                entity.HasOne(d => d.MakhNavigation)
                    .WithMany(p => p.Hoadons)
                    .HasForeignKey(d => d.Makh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HOADON__MAKH__3D5E1FD2");
            });

            modelBuilder.Entity<Hoso>(entity =>
            {
                entity.HasKey(e => e.Mahs)
                    .HasName("PK__HOSO__603F20DD860E3575");

                entity.ToTable("HOSO");

                entity.Property(e => e.Mahs).HasColumnName("MAHS");

                entity.Property(e => e.Khuvuc)
                    .HasMaxLength(100)
                    .HasColumnName("KHUVUC");

                entity.Property(e => e.Makh).HasColumnName("MAKH");

                entity.Property(e => e.Ngaylap)
                    .HasColumnType("datetime")
                    .HasColumnName("NGAYLAP");

                entity.Property(e => e.Tinhtrang).HasColumnName("TINHTRANG");

                entity.HasOne(d => d.MakhNavigation)
                    .WithMany(p => p.Hosos)
                    .HasForeignKey(d => d.Makh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HOSO__MAKH__3B75D760");
            });

            modelBuilder.Entity<Khachhang>(entity =>
            {
                entity.HasKey(e => e.Makh)
                    .HasName("PK__KHACHHAN__603F592C48A1429F");

                entity.ToTable("KHACHHANG");

                entity.Property(e => e.Makh).HasColumnName("MAKH");

                entity.Property(e => e.Anhdaidien)
                    .HasMaxLength(255)
                    .HasColumnName("ANHDAIDIEN");

                entity.Property(e => e.Cmnd)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("CMND")
                    .IsFixedLength(true);

                entity.Property(e => e.Diachi)
                    .HasMaxLength(100)
                    .HasColumnName("DIACHI");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("EMAIL");

                entity.Property(e => e.Gioitinh)
                    .HasMaxLength(5)
                    .HasColumnName("GIOITINH");

                entity.Property(e => e.Madt).HasColumnName("MADT");

                entity.Property(e => e.Maqt).HasColumnName("MAQT");

                entity.Property(e => e.Mk)
                    .HasMaxLength(20)
                    .HasColumnName("MK");

                entity.Property(e => e.Ngaysinh)
                    .HasColumnType("datetime")
                    .HasColumnName("NGAYSINH");

                entity.Property(e => e.Sdt)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("SDT")
                    .IsFixedLength(true);

                entity.Property(e => e.Tenkh)
                    .HasMaxLength(40)
                    .HasColumnName("TENKH");

                entity.Property(e => e.Tk)
                    .HasMaxLength(20)
                    .HasColumnName("TK");

                entity.HasOne(d => d.MadtNavigation)
                    .WithMany(p => p.Khachhangs)
                    .HasForeignKey(d => d.Madt)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__KHACHHANG__MADT__4316F928");

                entity.HasOne(d => d.MaqtNavigation)
                    .WithMany(p => p.Khachhangs)
                    .HasForeignKey(d => d.Maqt)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__KHACHHANG__MAQT__4222D4EF");
            });

            modelBuilder.Entity<Lienhe>(entity =>
            {
                entity.HasKey(e => e.Malh)
                    .HasName("PK__LIENHE__603F414D2A72202B");

                entity.ToTable("LIENHE");

                entity.Property(e => e.Malh).HasColumnName("MALH");

                entity.Property(e => e.Diachi)
                    .HasMaxLength(100)
                    .HasColumnName("DIACHI");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .HasColumnName("EMAIL");

                entity.Property(e => e.Facebook)
                    .HasMaxLength(255)
                    .HasColumnName("FACEBOOK");

                entity.Property(e => e.Sdt)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("SDT")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Quoctich>(entity =>
            {
                entity.HasKey(e => e.Maqt)
                    .HasName("PK__QUOCTICH__602379EC34F38297");

                entity.ToTable("QUOCTICH");

                entity.Property(e => e.Maqt).HasColumnName("MAQT");

                entity.Property(e => e.Tenqt)
                    .HasMaxLength(50)
                    .HasColumnName("TENQT");
            });

            modelBuilder.Entity<Sanpham>(entity =>
            {
                entity.HasKey(e => e.Masp)
                    .HasName("PK__SANPHAM__60228A324B68BF4D");

                entity.ToTable("SANPHAM");

                entity.Property(e => e.Masp).HasColumnName("MASP");

                entity.Property(e => e.Dongia).HasColumnName("DONGIA");

                entity.Property(e => e.Img)
                    .HasMaxLength(255)
                    .HasColumnName("IMG");

                entity.Property(e => e.Madm).HasColumnName("MADM");

                entity.Property(e => e.Soluong).HasColumnName("SOLUONG");

                entity.Property(e => e.Tensp)
                    .HasMaxLength(50)
                    .HasColumnName("TENSP");

                entity.Property(e => e.Thongtin)
                    .HasMaxLength(1000)
                    .HasColumnName("THONGTIN");

                entity.HasOne(d => d.MadmNavigation)
                    .WithMany(p => p.Sanphams)
                    .HasForeignKey(d => d.Madm)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SANPHAM__MADM__412EB0B6");
            });

            modelBuilder.Entity<Tkadmin>(entity =>
            {
                entity.HasKey(e => e.Tk)
                    .HasName("PK__TKADMIN__3214E400A7E8CC01");

                entity.ToTable("TKADMIN");

                entity.Property(e => e.Tk)
                    .HasMaxLength(25)
                    .HasColumnName("TK");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("EMAIL");

                entity.Property(e => e.Hoten)
                    .HasMaxLength(40)
                    .HasColumnName("HOTEN");

                entity.Property(e => e.Mk)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("MK");
            });

            modelBuilder.Entity<Tokhai>(entity =>
            {
                entity.HasKey(e => e.Matokhai)
                    .HasName("PK__TOKHAI__D056C0E8340721D7");

                entity.ToTable("TOKHAI");

                entity.Property(e => e.Matokhai).HasColumnName("MATOKHAI");

                entity.Property(e => e.Dinhungdau)
                    .HasMaxLength(100)
                    .HasColumnName("DINHUNGDAU");

                entity.Property(e => e.Makh).HasColumnName("MAKH");

                entity.Property(e => e.Nguoicobieuhien).HasColumnName("NGUOICOBIEUHIEN");

                entity.Property(e => e.Trieuchung)
                    .HasMaxLength(100)
                    .HasColumnName("TRIEUCHUNG");

                entity.Property(e => e.Txnguoibenh).HasColumnName("TXNGUOIBENH");

                entity.Property(e => e.Txnguoinuocbenh).HasColumnName("TXNGUOINUOCBENH");

                entity.HasOne(d => d.MakhNavigation)
                    .WithMany(p => p.Tokhais)
                    .HasForeignKey(d => d.Makh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__TOKHAI__MAKH__3C69FB99");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
