<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Pengambilan Simpanan Anggota<small> KPRI SEHAT DKK</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-money"></i> Pengambilan Simpanan Anggota</a></li>
        </ol>
    </section>
    <section class="content">    
        <div class="row">
            <div class='col-md-12'>
                <div class='panel panel-white' id="header">
                    <div class='panel-heading clearfix'>
                        <div class='col-md-10'>
                            <h4 id="warna">Selamat datang di <b>KPRI SEHAT DKK</b></h4>
                        </div>
                        <div id="tgl-login">
                            <h4><strong><?= tanggal_indo(date('Y-m-d')) ?></strong></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <center><p><?php  echo $this->session->flashdata('message'); ?></p></center>
            </div>
            <div class="col-md-12">                
                <div class="box">
                    <div class="box-header with-border">
                        <h2 class="box-title"><b><i class="fa fa-edit"></i> Edit <?= $title ?></b></h2>
                    </div>
                    <div class="box-body">
                        <?php foreach($edit as $a) : ?>
                        <form action="keanggotaan/saldo/aksi_edit" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">No. Anggota</label>
                                        <input type="text" name="no_anggota" id="no_anggota" class="form-control" value="<?= $a->no_anggota ?>" placeholder="No. Anggota" readonly>
                                        <input type="hidden" name="id" value="<?= $a->id ?>" required>
                                        <input type="hidden" name="id_user" value="<?= $a->id_user ?>" required>
                                        <input type="hidden" name="tanggalnya" value="<?= $a->tanggal ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Nama Anggota</label>
                                        <input type="text" name="nama" class="form-control" value="<?= $a->nama ?>" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Tgl. Transaksi</label>
                                        <input type="date" name="tanggal" class="form-control" value="<?= substr($a->tanggal,0,10) ?>" required>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Nominal (Rp)</label>
                                        <input type="text" name="nominal" class="form-control" value="<?= $a->nominal ?>" id="inputku" onkeydown="return numbersonly(this, event);" onkeyup="javascript:tandaPemisahTitik(this);" placeholder="Nominal (Hanya Angka)" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button class="btn btn-success"><i class="fa fa-save"></i> Simpan Data</button>
                                        <a href="keanggotaan/saldo" class="btn btn-danger"><i class="fa fa-reply"></i> Kembali</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <?php endforeach ?>
                    </div>
                </div>
            </div>
        </div>
    </section>  
</div>