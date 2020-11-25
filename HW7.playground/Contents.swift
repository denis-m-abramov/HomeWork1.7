import UIKit

//:  [Сылка на тесты](https://docs.google.com/forms/d/e/1FAIpQLSeNUvNsLIHjKJluYyK7DvCuHRCbp7N4kYR9vDMw0ILdWeF1HQ/viewform)

//: # Home Work 7



/*:
 ## Задание 1
 1.1 Создайте класс `Shape` (родительский класс) со следующими свойствами:
 
 - `height: Float`
 
 - `width: Float`
 
 - `radius: Float`
 
 - `square: Float`
 
 - `perimeter: Float`
 
 Oбъявите в классе методы `squareOfShape` и `perimeterOfShape` для расчетов площади и периметра (длины) фигуры соответственно. Методы должены возвращать `Float`. Создайте инициализатор для сторон прямоугольника и отдельный инициализатор для радиуса.
 */
class Shape {
    var height: Float = 0
    var width: Float = 0
    var radius: Float = 0
    var square: Float = 0
    var perimeter: Float = 0
    
    var nameShape: String = ""
    
    init() {}
    
    init(radius: Float) {
        self.radius = radius
        self.nameShape = "circle"
    }
    
    init(height: Float, width: Float) {
        self.height = height
        self.width = width
        self.nameShape = "rectangle"
    }
    
    init(height: Float, width: Float, radius: Float) {
        self.height = height
        self.width = width
        self.radius = radius
        self.nameShape = "ellipse"
    }
    
    func squareOfShap() -> Float { return square }
    
    func perimeterOfShape() -> Float { return perimeter }
    
    func checksTheValue() {
        if radius < 0 || width < 0 || height < 0 {
            printsMessage()
        } else { description()
        }
    }
    
    func printsMessage() {
        print("Введено некорректное значение!")
    }
    
    func description() {
        print("Площадь фигуры \(nameShape) равна \(formatter.string(from: NSNumber(value: squareOfShap()))!), периметр (длина) равен \(formatter.string(from: NSNumber(value: perimeterOfShape()))!)")
    }
}


/*:
 1.2. Создайте классы `Circle`, `Rectangle` и `Ellipse`, унаследовав их от `Shape`. Переопределите методы `squareOfShape` и `perimeterOfShape` для каждого класса в соответствии с правилом расчета площади или периметра (длины) конкретной фигуры
 
 1.3 В каждом классе создайте метод `description`, который выводит на консоль сообщение следующего вида: «Площадь фигуры <тип фигуры> равна <... >, периметр (длина) равна <...>»
 */
let formatter = NumberFormatter()
formatter.numberStyle = NumberFormatter.Style.decimal
formatter.roundingMode = NumberFormatter.RoundingMode.up
formatter.maximumFractionDigits = 2
formatter.minimumFractionDigits = 2


class Circle: Shape {
    
    override func squareOfShap() -> Float {
        square = Float.pi * pow(radius, 2)
        return square
    }
    
    override func perimeterOfShape() -> Float {
        perimeter = 2 * Float.pi * radius
        return perimeter
    }
}

let circle = Circle(radius: 5)
circle.checksTheValue()

let circle1 = Circle(radius: -5)
circle1.checksTheValue()

let circle2 = Circle(radius: 10)
circle2.checksTheValue()


class Rectangle: Shape {
    
    override func squareOfShap() -> Float {
        square = height * width
        return square
    }
    
    override func perimeterOfShape() -> Float {
        perimeter = (height + width) * 2
        return perimeter
    }
}

let rectangle = Rectangle(height: 5, width: 10)
rectangle.checksTheValue()

let rectangle1 = Rectangle(height: -5, width: 10)
rectangle1.checksTheValue()

let rectangle2 = Rectangle(height: 2, width: 1)
rectangle2.checksTheValue()


class Ellipse: Shape {
    
    override func squareOfShap() -> Float {
        square = Float.pi * height * width
        return square
    }
    
    override func perimeterOfShape() -> Float {
        perimeter = (4 * Float.pi * width * height + width - height) / (width + height)
        return perimeter
    }
}

let ellipse = Ellipse(height: 4, width: 8, radius: 3)
ellipse.checksTheValue()

let ellipse1 = Ellipse(height: 4, width: 3, radius: 2)
ellipse1.checksTheValue()

let ellipse2 = Ellipse(height: 4, width: -1, radius: 3)
ellipse2.checksTheValue()


//: 1.4 Создайте по экземпляру каждого класса, кроме `Shape`, проинициализируйте свойства `height` и `width` или `radius` для каждого класса в любые значения и вызовите у каждого экземпляра класса метод `description`



/*:
 ## Задание 2
 
 2.1.
 
 Спроектировать проигрыватель(класс `AudioPlayer`), в него можно добавить одну или несколько композиций (метод `addCompositions(compositions: [AudioFile])`):
 - композиция (класс или структура `AudioFile`) имеет название, альбом, автора и длительность.
 
 Проигрыватель может:
 - перемешивать композиции(метод `shuffleCompositions()`)
 - выводить количество песен (свойство `numberOfCompositions`)
 - проигрывать следующую песню (метод `playNext()`), предыдущую (метод `playPrevious()`)
 - при проигрывании  песни выводить в консоль: "Играет композиция с именем <название>(<альбом>). Автор: <автор>",
 - если была  последняя композиция(песня), то при проигрывании следующей(`playNext()`) будет играться первая.
 - если песен нет, то при попытке проигрывания следующей песни или предыдущей выводить: "Композиции не найдены",
 
 2.2.
 
 К проигрывателю через USB может быть подключено одно из выходных устройств: Наушники(класс `Headphones`), Колонки(класс `Loudspeakers`).
 
 Колонки при начале проигрывания композиции в проигрывателе(если подключены) выводят в консоль "На колонках проигрывается неизвестный звук длительностью <длительность>"
 
 Наушники при начале проигрывания композиции в проигрывателе(если подключены) выводят в консоль "В наушниках проигрывается неизвестный звук длительностью <длительность>", где <длительность> - это длительность композиции.
 
 > Если интерфейс подключения один (USB), то может стоит подключать выходное устройство через протокол?
 
 2.3.
 Время послушать музыку! Для этого нужно последовательно выполнить действия:
 
 - Создать объект класса проигрыватель(`AudioPlayer`),
 - Добавить в него 3 любые песни `addCompositions`, пример песни: `AudioFile(title: "Anesthetize", album: "Fear of a Blank Planet", author: "Porcupine Tree", lengthSeconds: 1063)`
 - Проиграть 1 песню (и вспомнить, что выходное устройство не подключено :-))
 - Подключить к проигрывателю колонки `Loudspeakers`.
 - Перемешать песни (метод `shuffleCompositions()`)
 - Проиграть 5 песен через метод `playNext()`.
 - Вместо колонок подключить наушники `Headphones`
 - Проиграть 2 песни.
 
 */


