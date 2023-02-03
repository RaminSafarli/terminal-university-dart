import 'dart:io';

void main(List<String> args) {
  // Default account
  String defaultStudentId = '1234asd';
  String defaultPassword = '1234demo';

  // String subjectSecond = 'Computer Networks';
  // String secondTeacher = 'Arzu Akhundov';

  // String subjectThird = 'Digital Systems';
  // String thirdTeacher = 'Yashar Hajiyev';

  Subject subjectOne = new Subject();
  subjectOne.name = 'Object-Oriented Programming';
  subjectOne.teacher = 'Ulviyya Abdulla';
  subjectOne.activity = 5;
  subjectOne.quizOne = 10;
  subjectOne.quizTwo = 8;
  subjectOne.quizThree = 9;
  subjectOne.quizAmount = 3;
  subjectOne.presentationScore = 10;
  subjectOne.midtermScore = 25;
  subjectOne.credit = 7;

  double firstSubjectQuiz = subjectOne.GetAverageQuizScore(subjectOne.quizOne,
      subjectOne.quizTwo, subjectOne.quizThree, subjectOne.quizAmount);
  double firstPreExamScore = subjectOne.GetPreExamScore(subjectOne.activity,
      firstSubjectQuiz, subjectOne.presentationScore, subjectOne.midtermScore);

  print("####################################");
  print("****** Telebe Melumat Sistemi ******");
  print("####################################");

  stdout.write("ID-inizi daxil edin: ");
  String? studentId = stdin.readLineSync();

  stdout.write("Sifrenizi daxil edin:");
  String? password = stdin.readLineSync();

  while (!(studentId == defaultStudentId && password == defaultPassword)) {
    if (studentId == "" || password == "") {
      print("Xahis olunur xanalari doldurun.");
    } else {
      print("ID ve ya sifre yanlisdir!");
    }

    main(args);
  }

  print("****** Bu semestr secdiyiniz fenler ******");
  // print("1. $subjectFirst\n" + "2. $subjectSecond\n" + "3. $subjectThird");
  print("1. ${subjectOne.name}\n");
  stdout.write(
      "Fenn haqqinda etrafli melumat ucun qarsisindaki reqemi daxil edin: ");

  String? key = stdin.readLineSync();
  print("####################################");
  switch (key) {
    case "1":
      subjectOne.credit = 7;

      print("${subjectOne.teacher} | ${subjectOne.name}");
      print("Bu fennin krediti: ${subjectOne.credit}");

      print("- Activity: ${subjectOne.activity}\n" +
          "- Average Quiz Score: $firstSubjectQuiz | Quiz 1: ${subjectOne.quizOne} | Quiz 2: ${subjectOne.quizTwo} | Quiz 3: ${subjectOne.quizThree}\n" +
          "- Presentation: ${subjectOne.presentationScore}\n" +
          "- Midterm: ${subjectOne.midtermScore}\n" +
          "- Pre-exam Score ${firstPreExamScore}\n" +
          "- Final Score: Daxil Edilməyib!");

      print("*****");

      stdout.write(
          "Final baliniz sisteme daxil etmek isteyirsinizse {y} duymesini, istemirsinizse {n} duymesini basin: ");
      String? click = stdin.readLineSync();
      click != null ? click = click.toLowerCase() : click;

      if (click == 'y') {
        stdout.write('Final balinizi daxil edin(Maksimum 50 ola biler): ');
        int finalScore = int.parse(stdin.readLineSync() ?? '0');
        if (finalScore > 50 || finalScore < 0) {
          print('Duzgun qiymet daxil etmediniz!');
        }
        print("Sizin Final baliniz: ${finalScore}");

        double totalScore = firstPreExamScore + finalScore;

        print(
            'Sizin umumi baliniz: ${totalScore} | ${GetLetterGrade(totalScore)}');
      } else if (click == 'n') {
        print('Tesekkur edirik!');
      } else {
        print("Yanlis secim!");
        main(args);
      }

      break;

    // case "2":
    //   break;

    // case "3":
    //   break;

    default:
  }
}

class Subject {
  String? name;
  String? teacher;
  int? activity;
  double? quizOne;
  double? quizTwo;
  double? quizThree;
  int? quizAmount;
  int? presentationScore;
  double? midtermScore;
  int? credit;

  double GetAverageQuizScore(quizOne, quizTwo, quizThree, quizAmount) {
    double averageQuizScore = (quizOne + quizTwo + quizThree) / quizAmount;

    return averageQuizScore;
  }

  double GetPreExamScore(
      activity, averageQuizScore, midtermScore, presentationScore) {
    double preExamScore =
        activity + averageQuizScore + presentationScore + midtermScore;

    return preExamScore;
  }
}

String GetLetterGrade(totalGrade) {
  if (totalGrade >= 0 && totalGrade < 51) {
    return 'FAIL';
  } else if (totalGrade >= 91) {
    return 'A';
  } else if (totalGrade >= 81) {
    return 'B';
  } else if (totalGrade >= 71) {
    return 'C';
  } else if (totalGrade >= 61) {
    return 'D';
  } else if (totalGrade >= 51) {
    return 'E';
  } else {
    return 'ERROR';
  }
}
