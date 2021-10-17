<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
        <?= $title ?><small> KPRI SEHAT DKK</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-users"></i> <?= $title ?></a></li>
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
        <div class="box box-default">
            <center><p><?php  echo $this->session->flashdata('message'); ?></p></center>
            <div class="box-header with-border">
                <h2 class="box-title"><b><i class="fa fa-edit"></i> Edit Produk PPOB</b></h2>
            </div>
            <div class="box-body">
                <?php foreach($edit as $a) : ?>
                <form action="admin/produk/aksi_editppob" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Kode Produk</label>
                                <input type="hidden" name="id" value="<?= $a->id_produk_koperasi ?>">
                                <input type="hidden" name="id_koperasi" value="<?= $a->id_koperasi ?>">
                                <input type="hidden" name="id_produk" value="<?= $a->id ?>">
                                <input type="text" name="code_produk" class="form-control" value="<?= $a->code_produk ?>" placeholder="Kode Produk" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Nama Produk</label>
                                <input type="text" name="nama" class="form-control" value="<?= $a->nama ?>" placeholder="Nama Produk" required readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Kategori Produk</label>
                                <input type="text" name="kategori" class="form-control" value="<?= $a->kategori ?>" placeholder="Kategori Produk" required readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Harga Dari Indora</label>
                                <input type="text" name="harga" class="form-control" id="inputku" onkeydown="return numbersonly(this, event);" value="<?= $a->harga+$a->biaya_admin ?>" onkeyup="javascript:tandaPemisahTitik(this);" placeholder="Harga Beli Satuan (Hanya Angka)" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Biaya Admin KPRI SEHAT</label>
                                <input type="text" name="nominal" class="form-control" id="inputku" onkeydown="return numbersonly(this, event);" value="<?= $a->nominal ?>" placeholder="Harga Produk (Hanya Angka)" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Status Produk</label>
                                <select name="status" class="form-control" required>
                                    <option value="ACTIVE" <?php if($a->status == 'ACTIVE'){ echo 'selected'; } ?>>Aktif</option>
                                    <option value="NO ACTIVE" hidden>Tidak Aktif</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Deskripsi Produk</label>
                                <textarea id="editor1" class="form-control" name="deskripsi" rows="10" cols="80" required><?= $a->deskripsi ?></textarea>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <button class="btn btn-success"><i class="fa fa-save"></i> Simpan Data</button>
                                <a href="admin/produk/ppob" class="btn btn-danger"><i class="fa fa-sign-out"></i> Kembali</a>
                            </div>
                        </div>
                    </div>
                </form>
                <?php endforeach ?>
            </div>
        </div>
    </section>
</div>  