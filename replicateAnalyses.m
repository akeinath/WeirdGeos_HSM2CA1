% get the paths to the subject data files, these will be passed to our
% analysis functions. Run this first and then the remaining functions can
% be run separately in whatever order you want for whichever analyses
% you're interested in.

p = getFilePaths('MatlabData/Experiment_1_ToShare','.mat');

% Plot error in the open square configuration across blocks
plotFamError(p);

% Plot velocity in the open square configuration across blocks
plotRT(p);

% Compute vector field maps and replacement spread as a function of
% distance to inserted boundaries.
dispxD2B(p);

% Multidimensional scaling (MDS) results for overall map and partition-wise
% map comparisons.
hsmMDS(p)

% RSA for overall map comparisons between Human spatial memory and mouse
% CA1 (Requires ParFor parallel looping; Grid search commented out because
% the runtime is very long (>hours depending on the rig). Can comment it
% back in if you want to run it! Otherwise still takes a pretty decent
% chunk of time to run on a decent rig (>1hr; median-split comparisons eat most of this);
rsa_h2hip_overall(p);

% RSA for partition-to-partition map comparisons between Human spatial memory and mouse
% CA1 (Requires ParFor parallel looping; Grid search commented out because
% the runtime is very long (>hours depending on the rig). Can comment it
% back in if you want to run it! Otherwise still takes a pretty decent
% chunk of time to run on a decent rig (>1hr; median-split comparisons eat most of this);
rsa_h2hip_partitions(p);


%%%%%%%%%%% Comparisons between experiments %%%%%%%%
% Note: Data from experiments 2 and 3 are missing some pieces of info that
% some of the analyses above require for the sake of reducing file sizes. 
% We will of course share the complete datasets on publication. The data do
% contain what is needed for cross-experiment comparions, which can be run
% below

% Experiment 1 to Fog comparison
p1 = getFilePaths('MatlabData/Experiment_1_ToShare','.mat');
p3 = getFilePaths('MatlabData/Experiment_2_Fog_Combined_ToShare','.mat');
rsa_h2hip_groupComp(p1,p3);

% Experiment 1 to Large Room comparison
p1 = getFilePaths('MatlabData/Experiment_1_ToShare','.mat');
p2 = getFilePaths('MatlabData/Experiment_3_LargeRoom_Combined_ToShare','.mat');
rsa_h2hip_groupComp(p1,p2);