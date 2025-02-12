a(age, ['50_54', '55_59', '60_64', '65_69', '70_74', '75_79', '80_84', '85_89']).
a(gender, [0,1]).             														% 0=M, 1=F
a(ethnicity, [0,1,2,3]).     													    % 0=Caucasian, 1=African American, 2=Asian, 3=Other
a(educationlevel, [0,1,2,3]). 														% 0=None, 1=High School, 2=Bachelor's, 3=Higher
a(bmi, ['sottopeso','peso_ideale','sovrappeso', 'obeso']).
a(smoking, [0,1]).           														% 0=NO, 1=SI
a(alcoholconsumption, ['leggero', 'moderato','elevato']).
a(physicalactivity, ['bassa','moderata','alta']).
a(dietquality, ['molto_scarsa', 'scarsa', 'media', 'buona', 'eccellente']).
a(sleepquality, ['bassa', 'media','alta']).
a(familyhistoryparkinsons, [0,1]).													% 0=NO, 1=SI
a(traumaticbraininjury, [0,1]).														% 0=NO, 1=SI
a(hypertension, [0,1]).																% 0=NO, 1=SI
a(diabetes, [0,1]).																	% 0=NO, 1=SI
a(depression, [0,1]).																% 0=NO, 1=SI
a(stroke, [0,1]).																	% 0=NO, 1=SI
a(systolicbp, ['normale','elevata','ipertensione_tipo_1','ipertensione_tipo_2']).
a(diastolicbp, ['normale','ipertensione_tipo_1','ipertensione_tipo_2']).
a(cholesteroltotal, ['desiderabile','al_limite','alto']).
a(cholesterolldl, ['ottimale','quasi_ottimale','al_limite','alto','molto_alto']).
a(cholesterolhdl, ['basso','normale','protettivo']).
a(cholesteroltriglycerides, ['normale','limite','alto']).
%attributo(updrs, ['lieve','moderato','moderato severo','severo','estremamente severo']).
a(moca, ['severo','moderato','lieve','normale']).
a(functionalassessment, ['severa','moderata','lieve','normale']).
a(tremor, [0,1]).																	% 0=NO, 1=SI
a(rigidity, [0,1]).																	% 0=NO, 1=SI
a(bradykinesia, [0,1]).																% 0=NO, 1=SI
a(posturalinstability, [0,1]).														% 0=NO, 1=SI
a(speechproblems, [0,1]).															% 0=NO, 1=SI	
a(sleepdisorders, [0,1]).															% 0=NO, 1=SI
a(constipation, [0,1]).																% 0=NO, 1=SI
a(updrs, ['lieve','moderato','moderato_severo','severo','estremamente_severo']).