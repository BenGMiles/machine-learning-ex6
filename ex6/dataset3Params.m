function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%


possVals = [0.01 0.03 0.1 0.3 1 3 10 20];
% Init minum error as infinite so it gets set on first pass
minimumError = Inf;

fprintf('Searching for C and Sigma');

for C = possVals
  for sigma = possVals
    fprintf('_');
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
    predictionError = mean(double(predictions ~= yval));

    if(predictionError <= minimumError)

      finalC = C;
      finalSigma = sigma;
      minimumError = predictionError;
      fprintf('New minimums found. C = %f. Sigma = %f. Error: %f',
              finalC, finalSigma, minimumError);
    end
  end
end
C = finalC;
sigma = finalSigma;




% =========================================================================

end
