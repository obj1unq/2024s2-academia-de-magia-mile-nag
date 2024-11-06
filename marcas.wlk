import cosas.*

object acme {
   method valorQueAporta(cosa) {
     return cosa.volumen() / 2
   } 
}

object fenix {
   method valorQueAporta(cosa) {
     return if (cosa.esReliquia()) 3 else 0
   } 

}

object cuchuflito{
   method valorQueAporta(cosa) {
     return 0
   } 
}