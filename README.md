SPATIAL SHOES

Construye una app para la tienda Spatial Shoes, que mostrará los modelos

3D junto a los datos de cada modelo de zapato. La forma de construir la

UI es totalmente libre, pero debemos respetar la guía de diseño de

interfaces nativas de Apple.

Existe un archivo shoes.json que tiene toda la información necesaria.
```
struct Shoe: Codable {

let id: Int
let name: String
let brand: String
let size: [Int]
let price: Double
let description: String
let model3DName: String
let type: String
let materials: [String]
let origin: String
let gender: String
let weight: Double
let colors: [String]
let warranty: Int
let certifications: [String]

}
```
Hay que cargar el archivo, que será de solo lectura. Los datos no serán

editables desde la app, solo mostrarán los datos de esta.

Es completamente libre el análisis de los datos y la creación de

enumeraciones a cualquier sub-estructura de información que necesites

para optimizar el catálogo.

En el campo model3DName está el modelo 3D USDZ que se encuentra en la

carpeta 3D. Se deberá crear una archivo en Reality Composer Pro que

contenga todos los modelos para que estén bien organizados.

Todas las tareas a realizar son obligatorias salvo la última del espacio

inmersivo que es opcional para quien quiera ir un poco más allá.

Se pueden crear escenas en Reality Composer Pro si se desea y hay que

gestionar la escala de cada modelo que será diferente para cada caso,

pero en la app deben verse todos del mismo tamaño.

Tareas a realizar:

- Crear un catálogo que muestre toda la información y los modelos.

- Los modelos podrán manipularse en 3D para poder verlos desde cualquier

orientación y tamaño en un modo de visión "libre".  

- [ ] Solucionar que roto uno y rotan todos
- [ ] Solucionar que se cambia una escala y se cambian todas  

    
    
    
    

- También existirá un modo "expositor" que podrá elegirse en la pantalla

para que el modelo gire de manera continua y automática.

- Podrá pulsarse en un modelo 3D para verlo en una ventana volumétrica

de manera exclusiva y en más detalle.


- [x] Hacer que se vea mas grande



- Se podrá marcar como favorito cualquiera de los modelos.

- Se generará un layout nuevo para estos favoritos en modo estantería

donde podrán verse los modelos 3D rotando de forma continua con su

nombre debajo y al pulsarlo se mostrará su ficha en más detalle.  

- [x] Agregar gesto ontap para mostrar la home view con la ficha de este shoe
- [x] Mostrar el detalle del seleccionado
- [ ] Mostrar solo los favoritos  



- Se creará un espacio inmersivo donde habrá un carrusel de zapatos.

Aparecerá el primero delante nuestro con unos botones de siguiente o

anterior, que harán que se muestren los demás. Se puede crear haciendo

que entren y salgan de pantalla por opacidad (por ejemplo) o incluso

en una rueda donde veas los demás como se van aproximando. La forma de

presentar este espacio es libre. Pero tienen que poder verse al máximo

de detalle posible mientras lo tengamos "cogido" y al soltarlo volverá

a su posición en el espacio de muestra.


-------
Plus  
- [x] Ver si dejar como esta el tema de ver el detalle de los favoritos en la home o si mostrar una ventana que se abra por debajo como los detalles que se muestran en la seria de bigbangtheory

# SpatialShoes

**SPATIAL SHOES**

Construye una app para la tienda Spatial Shoes, que mostrará los modelos 3D junto a los datos de cada modelo de zapato. La forma de construir la

UI es totalmente libre, pero debemos respetar la guía de diseño de interfaces nativas de Apple.

Existe un archivo **shoes.json** que tiene toda la información necesaria.

```
struct Shoe: Codable {
    let id: Int
    let name: String
    let brand: String
    let size: [Int]
    let price: Double
    let description: String
    let model3DName: String
    let type: String
    let materials: [String]
    let origin: String
    let gender: String
    let weight: Double
    let colors: [String]
    let warranty: Int
    let certifications: [String]
}
```
Hay que cargar el archivo, que será de solo lectura. Los datos no serán editables desde la app, solo mostrarán los datos de esta.

Es completamente libre el análisis de los datos y la creación de enumeraciones a cualquier sub-estructura de información que necesites para optimizar el catálogo. En el campo model3DName está el modelo 3D USDZ que se encuentra en la carpeta 3D. Se deberá crear una archivo en Reality Composer Pro que
contenga todos los modelos para que estén bien organizados.
Todas las tareas a realizar son obligatorias salvo la última del espacio inmersivo que es opcional para quien quiera ir un poco más allá.

Se pueden crear escenas en Reality Composer Pro si se desea y hay que gestionar la escala de cada modelo que será diferente para cada caso, pero en la app deben verse todos del mismo tamaño.

**Tareas a realizar:**

- [x] Crear un catálogo que muestre toda la información y los modelos.
    - [x] Obtener los valores del Json
    - [x] Mostrar la lista de las zapatillas con sus datos
    - [x] Cargar los modelos 3D
    - [x] Mostrar los modelos 3D
     
    Plus        
    - [ ] Error handler
    - [ ] Ordenar por favoritos
    - [ ] Mostrar la estrella de favoritos adelante de cada nombre en la lista
  
    - [ ] **Atencion a esto!!** **en el json de los planetas se usa una escala "scale": [0.003506540175362943,0.003506540175362943, 0.003506540175362943], segun el planeta, probar lo mismo para tus modelos 3D**

    - [ ] Los modelos podrán manipularse en 3D para poder verlos desde cualquier orientación y tamaño en un modo de visión "libre".
    - [ ] Agregar rotacion en vertical tambien
    - [x] ver que diferencia hay entre cargar los modelos 3D directamente o en el package que genera reality composer pro
      La diferencia es lo que podes hacer porque el modelo esta pegado a la vista entonces quedas limitado a lo que se puede hacer solo con una vista.
    - [x] Terminar de ver el video de bender
    - [x] Terminar de ver video n 6
    - [x] que es eso de vision libre?

- [x] Mostrar los detalles de cada zapato
- [ ] Formatear el texto
- [x] Agregar el toolbar con las opciones de ver detalle, rotar (que seria el modo expositor), magnify
- [ ] Faltaria que cuando toco un boton desaparece el otro si esta seleccionado
- [x] Cuando se haga click en ver detalle mostrar el modelo 3D volumetrico
- [x] Ver como seria el manejo de favorito
- [x] Agregar la opcion de poder seleccionarlo como favorito
- [ ] Ver el tema de poner un tamano real para cada zapato
- [ ] Ver donde pones el tema de mostrar los favoritos, si los ordenas o no

- [x] Ver como esta el hello world de apple
- [x] También existirá un modo "expositor" que podrá elegirse en la pantalla para que el modelo gire de manera continua y automática.
- [ ] Podrá pulsarse en un modelo 3D para verlo en una ventana volumétrica de manera exclusiva y en más detalle.
- [ ] Se podrá marcar como favorito cualquiera de los modelos.
- [ ] Se generará un layout nuevo para estos favoritos en modo estantería donde podrán verse los modelos 3D rotando de forma continua con su nombre debajo y al pulsarlo se mostrará su ficha en más detalle
- [ ] Se creará un espacio inmersivo donde habrá un carrusel de zapatos. Aparecerá el primero delante nuestro con unos botones de siguiente o anterior, que harán que se muestren los demás. Se puede crear haciendo que entren y salgan de pantalla por opacidad (por ejemplo) o incluso en una rueda donde veas los demás como se van aproximando. La forma de presentar este espacio es libre. Pero tienen que poder verse al máximo de detalle posible mientras lo tengamos "cogido" y al soltarlo volverá a su posición en el espacio de muestra.

- [ ] Crear icono de la app
- [ ] 
