<?php
require_once'functions.php';

/** login */ 
if ($act=='login'){
    $user = esc_field($_POST['user']);
    $pass = esc_field($_POST['pass']);
    
    $row = $db->get_row("SELECT * FROM tb_user WHERE username='$user' AND password='$pass'");
    if($row){
        $_SESSION['login'] = $row->username;
        redirect_js("index.php");
    } else{
        print_msg("Salah kombinasi username dan password.");
    }          
}

/** password */
else if ($mod=='password'){
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    $pass3 = $_POST['pass3'];
    
    $row = $db->get_row("SELECT * FROM tb_user WHERE username='$_SESSION[login]' AND password='$pass1'");        
    
    if($pass1=='' || $pass2=='' || $pass3=='')
        print_msg('Field bertanda * harus diisi.');
    elseif(!$row)
        print_msg('Password lama salah.');
    elseif( $pass2 != $pass3 )
        print_msg('Password baru dan konfirmasi password baru tidak sama.');
    else{        
        $db->query("UPDATE tb_user SET password='$pass2' WHERE username='$_SESSION[login]'");                    
        print_msg('Password berhasil diubah.', 'success');
    }
} elseif($act=='logout'){
    session_start();
    session_destroy();
    header("location:login.php");

}

/** alternatif */    
if($mod=='alternatif_tambah'){
    $kode = $_POST['kode'];
    $nama = $_POST['nama'];
    
    if($kode=='' || $nama=='' )
        print_msg("Field bertanda * tidak boleh kosong!");
        
   elseif($db->get_results("SELECT * FROM tb_alternatif WHERE kode_alternatif='$kode'"))
        print_msg("Kode sudah ada!");
    else{
        $db->query("INSERT INTO tb_alternatif (kode_alternatif, nama_alternatif) 
            VALUES ('$kode', '$nama')");
        $db->query("INSERT INTO tb_into_alternatif(kode_alternatif, kode_kriteria) 
            SELECT '$kode', kode_kriteria FROM tb_kriteria");
        redirect_js("index.php?m=alternatif");
    }                    
} else if($mod=='alternatif_ubah'){
    $kode = $_POST['kode'];
    $nama = $_POST['nama'];
    
    if($kode=='' || $nama=='')
        print_msg("Field bertanda * tidak boleh kosong!");
    else{
        $db->query("UPDATE tb_alternatif SET nama_alternatif='$nama' WHERE kode_alternatif='$_GET[ID]'");
        redirect_js("index.php?m=alternatif");
    }    
} else if ($act=='alternatif_hapus'){
    $db->query("DELETE FROM tb_alternatif WHERE kode_alternatif='$_GET[ID]'");
    $db->query("DELETE FROM tb_nilai_alternatif WHERE kode_alternatif='$_GET[ID]'");
    header("location:index.php?m=alternatif");
} 
    
/** kriteria */    
if($mod=='kriteria_tambah'){
    $kode = $_POST['kode'];
    $nama = $_POST['nama'];
    $atribut = $_POST['atribut'];
    $bobot = $_POST['bobot'];
    
    if($kode=='' || $nama=='' || $atribut=='' || $bobot=='')
        print_msg("Field bertanda * tidak boleh kosong!");
        
    elseif($db->get_results("SELECT * FROM tb_kriteria WHERE kode_kriteria='$kode'"))
        print_msg("Kode sudah ada!");    
    else{
        $db->query("INSERT INTO tb_kriteria (kode_kriteria, nama_kriteria, atribut, bobot) 
            VALUES ('$kode', '$nama', '$atribut', '$bobot')"); 
        $db->query("INSERT INTO tb_nilai_alternatif(kode_alternatif, kode_kriteria, nilai) 
            SELECT kode_alternatif, '$kode', 0  FROM tb_alternatif");           
        redirect_js("index.php?m=kriteria");
    }                    
} else if($mod=='kriteria_ubah'){
    $nama = $_POST['nama'];
    $atribut = $_POST['atribut'];
    $bobot = $_POST['bobot'];
    
    if($nama=='' || $atribut=='' || $bobot=='')
        print_msg("Field bertanda * tidak boleh kosong!");
    else{
         $db->query("UPDATE tb_kriteria SET nama_kriteria='$nama', atribut='$atribut', bobot='$bobot' WHERE kode_kriteria='$_GET[ID]'");
        redirect_js("index.php?m=kriteria");
    }    
} else if ($act=='kriteria_hapus'){
    $db->query("DELETE FROM tb_kriteria WHERE kode_kriteria='$_GET[ID]'");
    $db->query("DELETE FROM tb_nilai_alternatif WHERE kode_kriteria='$_GET[ID]'");
    header("location:index.php?m=kriteria");
} 

/** relasi */ 
else if ($act=='nilai_alternatif_ubah'){
    foreach($_POST as $key => $value){
        $ID = str_replace('ID-', '', $key);
        $db->query("UPDATE tb_nilai_alternatif SET nilai='$value' WHERE ID='$ID'");
    }
    header("location:index.php?m=rel_alternatif");
}
?>
<script>

  function logout(){
      if (confirm('Are you sure you want to logout?')){
        window.location = "index.php";
        return true;
      }else{
        return false;
      }
    }
</script>