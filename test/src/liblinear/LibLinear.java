package liblinear;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

        public class LibLinear{
            public static void main(String[] args) throws Exception {
                ArrayList<ArrayList<FeatureNode>> featureMatrix = new ArrayList<ArrayList<FeatureNode>>();
                ArrayList<Integer> targetValue = new ArrayList<Integer>();

                File file = new File(args[1]);
                BufferedReader reader = null;
                reader = new BufferedReader(new FileReader(file));
                String str = null;
                int numOfSamples=0;
                while ((str = reader.readLine()) != null) {
                    targetValue.add((int)str.charAt(0));
                    ArrayList<FeatureNode> tmpList = new ArrayList<FeatureNode>();
                    for(int i=0;i<str.length()-1;++i){
                        if(str.charAt(i)==' '){
                            FeatureNode featureNode = new FeatureNode((int)str.charAt(i+1),(int)str.charAt(i+3));
                            tmpList.add(featureNode);
                        }
                    }
                    featureMatrix.add(tmpList);
                    numOfSamples++;
                }


        Problem problem = new Problem();
        problem.l = 5; // number of training examples：训练样本数
        problem.n = 5; // number of features：特征维数

        FeatureNode[][] features = new FeatureNode[featureMatrix.size()][];
        for(int i=0;i<featureMatrix.size();++i){
            features[i] = new FeatureNode[featureMatrix.get(i).size()];
            for(int j=0;j< featureMatrix.get(i).size();++j){
                features[i][j] = featureMatrix.get(i).get(j);
            }

        }
        problem.x = features; // feature nodes：特征数据
        int [] t = new int[0];
        //problem.y = targetValue.toArray(); // target values：类别

        SolverType solver = SolverType.L2R_LR; // -s 0
        double C = 1.0;    // cost of constraints violation
        double eps = 0.01; // stopping criteria

        Parameter parameter = new Parameter(solver, C, eps);
        Model model = Linear.train(problem, parameter);
        File modelFile = new File("model");
        model.save(modelFile);
        // load model or use it directly
        model = Model.load(modelFile);

        FeatureNode[] testNode = { new FeatureNode(1, 0.4), new FeatureNode(3, 0.3) };//test node
        double prediction = Linear.predict(model, testNode);
        System.out.print("classification result: "+prediction);
    }
}