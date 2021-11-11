# var inputs = $("input");
# var array = ['238d','M3Nn','V8mj','1RCH','kd9e','jCGt','HZeL','cIeX','suTx','mbGM','U7zw','9Kt6','9vE3','c5pq','TGOS','putA','Hw3V','ZFfg','GROL','6jnt','NNdy','Njbd','JUNT','VHA2','Cx4n','YxMz']
# let field_3 =  {
# 					"238d": 907,
# 					"M3Nn": 919,
# 					"V8mj": 970,
# 					"1RCH": 905,
# 					"kd9e": 917,
# 					"jCGt": 913,
# 					"HZeL": 922,
# 					"cIeX": 918,
# 					"suTx": 901,
# 					"mbGM": 905,
# 					"U7zw": 915,
# 					"9Kt6": 920,
# 					"9vE3": 1040,
# 					"c5pq": 1040,
# 					"TGOS": 1010,
# 					"putA": 902,
# 					"Hw3V": 906,
# 					"ZFfg": 907,
# 					"GROL": 915,
# 					"6jnt": 916,
# 					"NNdy": 906,
# 					"Njbd": 973,
# 					"JUNT": 903,
# 					"VHA2": 917,
# 					"Cx4n": 916,
# 					"YxMz": 917,
# }
#
# let fieldToIndex = [];
# for (let i = 0; i < 26; i++) {
#     fieldToIndex[field_3[array[i]]] = array[i];
# }
#
# let newa = [];
# for (let i = 680; i < 2000; i++) {
#     if(fieldToIndex[i] != undefined){
#         console.log(newa.length)
#         if(fieldToIndex[i] == 'V8mj'){
#             continue
#         }
#         if(newa.length == 13){
#             break
#         }
#         newa.push(fieldToIndex[i])
#     }
# }
#
# for (let i = 2000; i > 680; i--) {
#     if(fieldToIndex[i] != undefined){
#         if(fieldToIndex[i] == 'V8mj'){
#             continue
#         }
#         if(newa.length == 14){
#             break
#         }
#         newa.push(fieldToIndex[i])
#     }
# }
# newa.push(array[2])
# inputs.each(function(){
#     let value = $.inArray($(this).val(), newa);
#     if(value != -1){
#         $(this).click()
#     }
# });