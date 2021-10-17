<?php
    function tanggal_indo($tanggal){
        $aulan  = array (1 =>   'Jan',
                'Feb',
                'Mar',
                'Apr',
                'Mei',
                'Jun',
                'Jul',
                'Agu',
                'Sep',
                'Okt',
                'Nov',
                'Des'
                );
        $split = explode('-', $tanggal);
        return $split[2] . ' ' . $aulan[ (int)$split[1] ] . ' ' . $split[0];
    }

    function rupiah($angka){    
        $hasil_rupiah = number_format($angka,0,',','.');
        return $hasil_rupiah; 
    }

    function rupiah2($angka){    
        $hasil_rupiah = "Rp " . number_format($angka,0,',','.');
        return $hasil_rupiah; 
    }
?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cetak Invoice</title>
        <link href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'PT Sans', sans-serif;
                font-size : 20px;
            }
            .container{
                padding: 5mm;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            
            td,
            th {
                border: 0px solid #949494;
                text-align: justify;
                padding: 2px;
                font-weight: 100;
            }
            
            tr:nth-child(even) {
                background-color: #ffffff;
            }
        </style>
    </head>

    <body onload="window.print(); setTimeout(window.close, 0);">

        <center>
            <p>
                <strong>KPRI SEHAT BLORA</strong> <br>
                <small>Jl Dr Sutomo No 40 Blora<br>Email : kprisehat@gmail.com</small>
            </p>
            ===================================================================================
        </center>
        
        <p style="float:right;"><small><?= tanggal_indo(date('Y-m-d')).' '.date('H:i:s') ?></small></p><br>
        <p><small><?= $this->db->query("SELECT * FROM tbl_admin WHERE id = '$kasir' LIMIT 1")->row()->nama; ?></p>
        <table id="data" class="table" width="100%">
            <thead>
                <tr>
                    <th width="40%">Nama Produk</th>
                    <th>Harga</th>
                    <th width="100">Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1; foreach($transaksi as $b) : ?>
                <tr>
                    <td><?= $this->db->query("SELECT * FROM tbl_produk_agratek WHERE code_produk = '$b->denom' LIMIT 1")->row()->penyedia.' - '.$b->denom; ?></td>
                    <td><?= rupiah($b->harga_jual) ?></td>
                    <td><?= rupiah($b->harga_jual) ?></td>
                </tr>
                <?php endforeach ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2" style="text-align:right;">Total</th>
                    <th><?= rupiah($b->harga_jual) ?></th>
                </tr>
            </tfoot>
        </table>
        <center>
            <p>
                <small>Terima kasih telah berbelanja di <br> KPRI Sehat Blora</small>
            </p>
        </center>
    </body>

</html>