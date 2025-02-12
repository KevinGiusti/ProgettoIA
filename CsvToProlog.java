import java.io.*;

public class CsvToProlog {

    public static String age(int i) {
        if(i < 55) {
            return "age='50_54'";
        } else if (i < 60) {
            return "age='55_59'";
        } else if(i < 65) {
            return "age='60_64'";
        } else if(i < 70) {
            return "age='65_69'";
        } else if(i < 75) {
            return "age='70_74'";
        } else if(i < 80) {
            return "age='75_79'";
        } else if (i < 85) {
            return "age='80_84'";
        } else {
            return "age='85_89'";
        }
    }

    public static String bmi(Double i) {
        if(i < 18.5) {
            return "'sottopeso'";
        } else if (i < 25) {
            return "'peso_ideale'";
        } else if(i < 30) {
            return "'sovrappeso'";
        } else {
            return "'obeso'";
        }
    }

    public static String alcoholconsumption(Double i) {
        if(i < 8) {
            return "'leggero'";
        } else if (i < 15) {
            return "'moderato'";
        } else {
            return "'elevato'";
        }
    }

    public static String physicalactivity(Double i) {
        if(i < 2.5) {
            return "'bassa'";
        } else if (i < 5) {
            return "'moderata'";
        } else {
            return "'alta'";
        }
    }

    public static String dietquality(Double i) {
        if(i < 3) {
            return "'molto_scarsa'";
        } else if (i < 5) {
            return "'scarsa'";
        } else if (i < 7){
            return "'media'";
        } else if (i < 9) {
            return "'buona'";
        } else {
            return "'eccellente'";
        }
    }

    public static String sleepquality(Double i) {
        if(i < 7) {
            return "'bassa'";
        } else if(i < 9) {
            return "'media'";
        } else {
            return "'alta'";
        }
    }

    public static String systolicbp(int i) {
        if(i < 120) {
            return "'normale'";
        } else if(i < 130) {
            return "'elevata'";
        } else if(i < 140) {
            return "'ipertensione_tipo_1'";
        } else {
            return "'ipertensione_tipo_2'";
        }
    }

    public static String diastolicbp(int i) {
        if(i < 80) {
            return "'normale'";
        } else if(i < 89) {
            return "'ipertensione_tipo_1'";
        } else {
            return "'ipertensione_tipo_2'";
        }
    }

    public static String cholesteroltotal(Double i) {
        if(i < 200) {
            return "'desiderabile'";
        } else if(i < 240) {
            return "'al_limite'";
        } else {
            return "'alto'";
        }
    }

    public static String cholesterolldl(Double i) {
        if(i < 100) {
            return "'ottimale'";
        } else if(i < 130) {
            return "'quasi_ottimale'";
        } else if (i < 160) {
            return "'al_limite'";
        } else if (i < 190) {
            return "'alto'";
        } else {
            return "'molto_alto'";
        }
    }

    public static String cholesterolhdl(Double i) {
        if(i < 40) {
            return "'basso'";
        } else if(i < 60) {
            return "'normale'";
        } else {
            return "'protettivo'";
        }
    }

    public static String cholesteroltriglycerides(Double i) {
        if(i < 150) {
            return "'normale'";
        } if (i < 200) {
            return "'limite'";
        } else {
            return "'alto'";
        }
    }

    public static String updrs(Double i) {
        if(i < 33) {
            return "'lieve'";
        } else if(i < 66) {
            return "'moderato'";
        } else if(i < 99) {
            return "'moderato_severo'";
        } else if(i < 131) {
            return "'severo'";
        } else {
            return "'estremamente_severo'";
        }
    }

    public static String moca(Double i) {
        if(i < 16) {
            return "'severo'";
        } else if(i < 22) {
            return "'moderato'";
        } else if(i < 26) {
            return "'lieve'";
        } else {
            return "'normale'";
        }
    }

    public static String functionalassessment(Double i) {
        if(i < 3) {
            return "'severa'";
        } else if(i < 5) {
            return "'moderata'";
        } else if(i < 8) {
            return "'lieve'";
        } else {
            return "'normale'";
        }
    }

    public static void main(String[] args) throws IOException {
        try {
            BufferedReader br = new BufferedReader(new FileReader("parkinsons_disease_data.csv"));
            BufferedWriter bw = new BufferedWriter(new FileWriter("esempi.pl"));
            String line;
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                String esempio = "e(" + values[values.length - 2] + ", [";
                for (int i = 0; i < values.length - 2; i++) {
                    switch(i) {
                        case 1: esempio += age(Integer.parseInt(values[i])); break;
                        case 2: esempio += ", gender=" + values[i]; break;
                        case 3: esempio += ", ethnicity=" + values[i]; break;
                        case 4: esempio += ", educationlevel=" + values[i]; break;
                        case 5: esempio += ", bmi=" + bmi(Double.parseDouble(values[i])); break;
                        case 6: esempio += ", smoking=" + values[i]; break;
                        case 7: esempio += ", alcoholconsumption=" + alcoholconsumption(Double.parseDouble(values[i])); break;
                        case 8: esempio += ", physicalactivity=" + physicalactivity(Double.parseDouble(values[i])); break;
                        case 9: esempio += ", dietquality=" + dietquality(Double.parseDouble(values[i])); break;
                        case 10: esempio += ", sleepquality=" + sleepquality(Double.parseDouble(values[i])); break;
                        case 11: esempio += ", familyhistoryparkinson=" + values[i]; break;
                        case 12: esempio += ", traumaticbraininjury=" + values[i]; break;
                        case 13: esempio += ", hypertension=" + values[i]; break;
                        case 14: esempio += ", diabetes=" + values[i]; break;
                        case 15: esempio += ", depression=" + values[i]; break;
                        case 16: esempio += ", stroke=" + values[i]; break;
                        case 17: esempio += ", systolicbp=" + systolicbp(Integer.parseInt(values[i])); break;
                        case 18: esempio += ", diastolicbp=" + diastolicbp(Integer.parseInt(values[i])); break;
                        case 19: esempio += ", cholesteroltotal=" + cholesteroltotal(Double.parseDouble(values[i])); break;
                        case 20: esempio += ", cholesterolldl=" + cholesterolldl(Double.parseDouble(values[i])); break;
                        case 21: esempio += ", cholesterolhdl=" + cholesterolhdl(Double.parseDouble(values[i])); break;
                        case 22: esempio += ", cholesteroltriglycerides=" + cholesteroltriglycerides(Double.parseDouble(values[i])); break;
                        case 23: esempio += ", updrs=" + updrs(Double.parseDouble(values[i])); break;
                        case 24: esempio += ", moca=" + moca(Double.parseDouble(values[i])); break;
                        case 25: esempio += ", functionalassessment=" + functionalassessment(Double.parseDouble(values[i])); break;
                        case 26: esempio += ", tremor=" + values[i]; break;
                        case 27: esempio += ", rigidity=" + values[i]; break;
                        case 28: esempio += ", bradykinesia=" + values[i]; break;
                        case 29: esempio += ", posturalinstability=" + values[i]; break;
                        case 30: esempio += ", speechproblems=" + values[i]; break;
                        case 31: esempio += ", sleepdisorders=" + values[i]; break;
                        case 32: esempio += ", constipation=" + values[i]; break;
                        default: break;
                    }
                }
                esempio += "]).\n";
                bw.write(esempio);
            }
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}