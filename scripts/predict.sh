source wembedding_service/we_env/scripts/activate
wembedding_service/we_env/Scripts/python wembedding_service/compute_wembeddings.py --model="am-roberta" datasets/amharic/test.conllu datasets/amharic/test.conllu.npz
 source env/scripts/activate
 env/scripts/python udpipe2.py --predict am-udpipe2-model --predict_input datasets/amharic/test.conllu --predict_output output/out.conllu