import Foundation

var students: [Int:[Any]] = [:]
var notes: [Int:[String : [String : Float]]] = [:]
var transac: [Int:[[Int : Int]]] = [:]
var forTransac: [Int : Int] = [:]

var gestBoucle = true

while gestBoucle{
  print("MENU PRINCIPAL")
  print("1. GESTION DES ETUDIANTS")
  print("2. GESTION DE L'ECONOMAT")
  print("3. QUITTER L'APPLICATION")

  let choice = readLine()
  switch choice {
  case "1":
      gestionStudent()
  case "2":
      gestionEconomat()
  case "3":
    gestBoucle = false
  default:
      print("MAUVAISE CHOIX")
  }
}

// ------ DEBUT GESTION ETUDIANTS ------

//Fonction permettant d'enregistrement d'un étudiant
func gestionStudent(){
    clearConsole()
    
    var gestBoucle2 = true
    
    while gestBoucle2{
      print("MENU GESTION ETUDIANT")
      print("1. AJOUT D'UN ETUDIANT")
      print("2. LISTER LES ETUDIANTS")
      print("3. CALCULER LA MOYENNE D'UN ETUDIANT")
      print("4. Sortir du menu")
        
      let choice = readLine()

      switch choice {
        case "1":
          clearConsole()
          saveData()
        case "2":
          clearConsole()
          if(students.count == 0){
              print("Aucun eleve n'a ete enregistre")
          }else{
              displayStudents(students)
          }
        case "3":
            moyenneDesNotes()
        case "4":
            gestBoucle2 = false
        default:
            print("MAUVAIX CHOIX")
        }
    }
    
}

func saveData(){
    while true{
        clearConsole()
        var student: [Any] = []
        while true{
            print("Veuillez saisir le nom de l'étudiant : ")
            if let lastname = readLine(){
                student.append(lastname)
                break
            }else{
                print("Une erreur c'est produite")
            }    
        }
    
        while true{
            print("Veuillez saisir le prenom de l'étudiant : ")
            if let firstname = readLine(){
                student.append(firstname)
                break
            }else{
                print("Une erreur c'est produite")
            }
        }
    
        while true {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"  // Format attendu pour la date
            
            print("Veuillez saisir votre date de naissance de l'étudiant (format yyyy-MM-dd) :")
            
            if let dateString = readLine(), let date = dateFormatter.date(from: dateString) {
                let calendar = Calendar.current
                let today = Date()
                let ageComponents = calendar.dateComponents([.year], from: date, to: today)
                if let age = ageComponents.year, age > 2{
                    student.append(date)
                    break
                }else{
                    print("La personne n'a pas l'age requis")
                }
            } else {
                print("Format de date invalide. Veuillez réessayer (format yyyy-MM-dd) :")
            }
        }
    
        var forMenu = false
        while !forMenu{
            print("LES CLASSES DE L'ETABLISSEMENT")
            print("1. 1ere ANNEE")
            print("2. 2eme ANNEE")
            print("3. 3eme ANNEE")
            print("4. 4eme ANNEE")
            print("5. 5eme ANNEE")
            print("6. 6eme ANNEE")
            print("7. 7eme ANNEE")
            print("8. 8eme ANNEE")
            print("9. 9eme ANNEE")
            print("10. SECONDAIRE 1")
            print("11. SECONDAIRE 2")
            print("12. SECONDAIRE 3")
            print("13. SECONDAIRE 4")
    
            let choice = readLine()
    
            forMenu = true
            switch choice{
                case "1":
                    student.append("1ere ANNEE")
                    student.append(10000)
                    break
                case "2":
                    student.append("2eme ANNEE")
                    student.append(10000)
                    break
                case "3":
                    student.append("3eme ANNEE")
                    student.append(10000)
                    break
                case "4":
                    student.append("4eme ANNEE")
                    student.append(10000)
                    break
                case "5":
                    student.append("5eme ANNEE")
                    student.append(10000)
                    break
                case "6":
                    student.append("6eme ANNEE")
                    student.append(10000)
                    break
                case "7":
                    student.append("7eme ANNEE")
                    student.append(20000)
                    break
                case "8":
                    student.append("8eme ANNEE")
                    student.append(20000)
                    break
                case "9":
                    student.append("9eme ANNEE")
                    student.append(20000)
                    break
                case "10":
                    student.append("SECONDAIRE 1")
                    student.append(20000)
                    break
                case "11":
                    student.append("SECONDAIRE 2")
                    student.append(20000)
                    break
                case "12":
                    student.append("SECONDAIRE 3")
                    student.append(20000)
                    break
                case "13":
                    student.append("SECONDAIRE 4")
                    student.append(20000)
                    break
                default:
                    forMenu = false
                    print("Mauvais choix")
            }
        }
    
        let cle = students.count + 1
    
        students[cle] = student
        print("SUCCES DE L'ENREGISTREMENT")
    
        print("Voulez vous enregistrer un autre étudiant ? (1. oui || 2. non)")
        if let choice2 = readLine(), choice2 == "2"{
            break
        }     
    }
}

//Fonction permettant d'afficher les eleves en prennant en parametre un dictionnaire
func displayStudents(_ students: [Int:[Any]]){
    clearConsole()
    print("AFFICHAGE DES ETUDIANTS")
    print("-----------------------")
    for (key, value) in students{
        print("Numero de l'étudiant : \(key)")

        
        print("Nom : \(value[0])")
        print("Prenom : \(value[1])")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = value[2] as? Date{
            
            let dateString = dateFormatter.string(from: date)
        
            print("Date de naissance : \(dateString)")
        }

        print("Classe : \(value[3])")
        print("M : \(value[4])")
        print("-----------------------")

        if notes.keys.contains(key){
            if let notesEtudiant = notes[key]{
                for (key2, value2) in notesEtudiant{
                    print("Note pour Trimestre : \(key2)")
                    print()
                    print(value2)
                    print("Moyenne : \(value2["Moyenne"] ?? 0)")
                }
            }
        }
    }
}

//Calcul de la moyenne d'un etudiant
func moyenneDesNotes(){
    clearConsole()
    var notesStudent: [String: Float] = [:]
    var trim: [String: [String: Float]] = [:]
    var trimestre: String = ""
    var classe: String = ""
    var codeStud: Int = 0
    
    let matieres = [
        //Matiere primaire
        ["Francais", "Maths", "Géographie", "Grammaire", "Mieux Parlé", "Histoire", "Sc Experiimental", "Vocabulaire"],
        //Matiere 7eme a 9eme
        ["Francais", "Maths", "Anglais", "Espagnol", "Sc. Social", "Sc. Experimental", "Physique"],
        //Matiere NS1 a NS4
        ["Littérature-Philosophie", "Maths", "Anglais", "Espagnol", "Physique", "Chimie", "Bio-Géo", "Histoire Nationale"]
    ]

    var forMenu = false
    while !forMenu{
        print("CALCULER LA MOYENNE POUR LE TRIMESTRE: ")
        print("1. 1er TRIMESTRE")
        print("2. 2eme TRIMESTRE")
        print("3. 3eme TRIMESTRE")

        let choice = readLine()

        forMenu = true
        switch choice{
            case "1":
                trimestre = "1er TRIMESTRE"
                break
            case "2":
                trimestre = "2eme TRIMESTRE"
                break
            case "3":
                trimestre = "3eme TRIMESTRE"
                break
            default:
                forMenu = false
                print("Mauvais choix")
        }
    }

    while true{
        print("Veuillez saisir le code de l'étudiant: ")
        if let nombre = readLine(), let code = Int(nombre){
            if let studentInfo = students[code] {
                if studentInfo.count > 3, let className = studentInfo[3] as? String{
                    if(notes.keys.contains(code)){
                        if let studentNotes = notes[code]{
                            if studentNotes.keys.contains(trimestre){
                                print("L'étudiant a deja une moyenne pour ce trimestre")
                            }else{
                                codeStud = code
                                classe = className
                                print("CODE : \(code) --- NOM : \(studentInfo[0]) --- PRENOM : \(studentInfo[1])")
                                print("CLASSE : \(classe)")
                                break 
                            }
                        }
                    }else{
                        codeStud = code
                        classe = className
                        print("CODE : \(code) --- NOM : \(studentInfo[0]) --- PRENOM : \(studentInfo[1])")
                        print("CLASSE : \(classe)")
                        break                        
                    }
                }
            } else {
                print("La clé \(code) n'existe pas dans le dictionnaire.")
            }
        }else{
            print("Une erreur c'est produite")
        }
    }

    if(classe == "1ere ANNEE" || classe == "2eme ANNEE" || classe == "3eme ANNEE" || classe == "4eme ANNEE" ||                 classe == "5eme ANNEE" || classe == "6eme ANNEE"){
        for i in 0..<matieres[0].count{
            while true{
                print("Veuillez saisir la note de \(matieres[0][i]): ")
                if let nombre = readLine(), let note = Float(nombre){
                    if note >= 0 && note <= 100{
                        notesStudent[matieres[0][i]] = note
                        break                        
                    }else{
                        print("La note doit etre comprise entre 0 et 100")
                    }
                }else{
                    print("Une erreur c'est produite")
                }
            }             
        }
    }else if(classe == "7eme ANNEE" || classe == "8eme ANNEE" || classe == "9eme ANNEE"){
        for i in 0..<matieres[1].count{
            while true{    
                print("Veuillez saisir la note de \(matieres[1][i]): ")
                if let nombre = readLine(), let note = Float(nombre){
                    if note >= 0 && note <= 100{
                        notesStudent[matieres[1][i]] = note
                        break                        
                    }else{
                        print("La note doit etre comprise entre 0 et 100")
                    }
                }else{
                    print("Une erreur c'est produite")
                }
            }            
        }
    }else{
        for i in 0..<matieres[2].count{
            while true{    
                print("Veuillez saisir la note de \(matieres[2][i]): ")
                if let nombre = readLine(), let note = Float(nombre){
                    if note >= 0 && note <= 100{
                        notesStudent[matieres[2][i]] = note
                        break                        
                    }else{
                        print("La note doit etre comprise entre 0 et 100")
                    }
                }else{
                    print("Une erreur c'est produite")
                }
            }
        }
    }
    //Calcul de la moyenne
    var moyenne: Float = 0
    for (_, note) in notesStudent{
        moyenne += note
    }
    moyenne /= Float(notesStudent.count * 10)

    //Ajout de la moyenne dans le dictionnaire
    notesStudent["Moyenne"] = moyenne

    //Ajout du dictionnaire dans le dictionnaire
    trim[trimestre] = notesStudent

    
    if codeStud > 0 {
        notes[codeStud] = trim
    }
}

// ------ FIN GESTION ETUDIANTS ------

func clearConsole() {
    print("\u{001B}[2J")
    print("\u{001B}[H")
}