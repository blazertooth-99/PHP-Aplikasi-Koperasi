<div class="content-wrapper" style="background-color: #fff;">
    <section class="content-header">
        <h1>
            <?= $title ?><small> KPRI SEHAT DKK</small>
        </h1>
        <ol class="breadcrumb">
            <li><p><i class="fa fa-money"></i> <?= $title ?></p></li>
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
                            <h4>
                                <strong>Saldo Deposit : <?= rupiah($saldo) ?></strong> <sup><i class="fa fa-info-circle" title="Batas saldo limit tidak bisa kurang dari sama dengan Rp. 100.000,00"></i></sup>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <center>
            <?php foreach($ppob_limit as $a) : ?>
            <a href="kasir/ppob/menu/<?= $a->kode ?>">
                <div class="col-md-1 col-sm-4 col-xs-6 menu-ppob">
                    <div class="box box-solid" style="box-shadow: none;">
                        <div class="box-body">
                            <center><img src="img/icon/<?= $a->foto ?>" alt="" width="40"></center><br>
                            <center><p><?= $a->nama ?></p></center>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>            
            </a>
            <?php endforeach ?>
            <a href="#" data-toggle="modal" data-target="#modal-default">
                <div class="col-md-1 col-sm-4 col-xs-6 menu-ppob">
                    <div class="box box-solid" style="box-shadow: none;">
                        <div class="box-body">
                            <center><img src="img/icon/icon_lain.png" alt="" width="40"></center><br>
                            <center><p>Lainnya</p></center>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>            
            </a>
            </center>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <center><div class="alert alert-warning" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> Mulai Januari 2021, tiket kereta api bisa dipesan maks. H+14. Jangan lupa cek Protokol Kesehatan terbaru agar bepergian makin aman.</div></center>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <center><p><?php  echo $this->session->flashdata('message'); ?></p></center>
                        <h2 class="box-title"><b><i class="fa fa-train"></i> Pesan tiket kereta online</b></h2>
                    </div>
                    <form action="kasir/ppob/aksi/kereta" method="post">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <div class="form-group">
                                                <label for="">Asal</label>
                                                <select name="asal" class="form-control select2" style="width:100%;">
                                                    <option value="" style="display:none;">- Stasiun Asal -</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 hidden-xs">
                                            <img src="img/icon/icon_jurusan_kai.png" alt="" width="30" style="margin-top: 25px; margin-left:-10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="">Tujuan</label>
                                                <select name="tujuan" class="form-control select2" style="width:100%;" >
                                                    <option value="" style="display:none;">- Stasiun Tujuan -</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="">Berangkat</label>
                                        <input type="text" name="berangkat" class="form-control" id="from" value="<?= date('m/d/Y') ?>" required>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="">Pulang</label>
                                        <input type="text" name="berangkat" class="form-control" id="to">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="">Jumlah Penumpang</label>
                                        <!-- <input type="text" name="jumlah_penumpang" class="form-control" placeholder="Jumlah Penumpang"> -->
                                        <div class="popover-markup"> 
                                            <div class="trigger form-group form-group-icon-left">
                                                <input type="text" name="passanger-info" id="passanger-info" class="form-control" value="Dewasa 1">
                                                <input type="hidden" name="passengers" id="passengers" class="form-control" value="1" disabled>
                                            </div>
                                            <div class="content hide">
                                                <div class="form-group">
                                                    <label class="control-label col-md-6"><img src="img/icon/icon_dewasa.png" alt="" width="15"> <strong>Dewasa</strong><br> <small>Usia >  3 tahun</small></label>
                                                    <div class="input-group number-spinner col-md-6">
                                                        <span class="input-group-btn">
                                                            <a class="btn btn-success" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></a>
                                                        </span>
                                                        <input type="text" disabled name="adult" id="adult" class="form-control text-center" value="1" max=9 min=1>
                                                        <span class="input-group-btn">
                                                            <a class="btn btn-warning" data-dir="up"><span class="glyphicon glyphicon-plus"></span></a>
                                                        </span>
                                                    </div>
                                                </div><hr>
                                                <div class="form-group">
                                                    <label class="control-label col-md-6"><img src="img/icon/icon_bayi.png" alt="" width="15"> <strong>Bayi</strong><br> <small>Usia < 3 tahun</small></label>
                                                    <div class="input-group number-spinner col-md-6">
                                                        <span class="input-group-btn">
                                                            <a class="btn btn-success" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></a>
                                                        </span>
                                                        <input type="text" disabled name="infant" id="infant" class="form-control text-center" value="0" max=9 min=0>
                                                        <span class="input-group-btn">
                                                            <a class="btn btn-warning" data-dir="up"><span class="glyphicon glyphicon-plus"></span></a>
                                                        </span>
                                                    </div>
                                                </div><hr>
                                                    <a class="btn btn-success btn-block demise">Simpan</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <div class="row">
                                <div class="col-lg-9"></div>
                                <div class="col-lg-3">
                                    <button class="btn btn-success btn-block"><b>Cari Tiket</b></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>  
</div>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title"><center><b>Layanan Lainnya</b></center></h3>
            </div>
            <div class="modal-body">                
                <div class="row">
                    <div class="col-lg-12">
                        <center>
                            <?php foreach($ppob as $b) : ?>
                            <a href="kasir/ppob/menu/<?= $a->kode ?>">
                                <div class="col-lg-4 col-md-4 col-sm-3 col-xs-4" style="margin-bottom: 10px;">
                                    <center><img src="img/icon/<?= $b->foto ?>" alt="" width="50"></center><br>
                                    <center><p><?= $b->nama ?></p></center><hr>
                                </div>            
                            </a>
                            <?php endforeach ?>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>