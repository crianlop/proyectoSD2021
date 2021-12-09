package proyectobd;

public class ProyectoBD {

    public static void main(String[] args) {
        Conexion conexion = Conexion.getInstancia();
        conexion.ConexionDB();
        Ventana_Principal v = new Ventana_Principal();
        v.setVisible(true);
    }
    
}
