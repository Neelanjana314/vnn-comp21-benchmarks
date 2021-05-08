function generate_properties_python(image_no, eps,label,ub,lb)

    ub = reshape(ub,[784,1]);
    lb = reshape(lb,[784,1]);
    
    %% Print to file
    file = sprintf('prop_%d_eps_%.3f.vnnlib',image_no,eps);
    fid = fopen(file, 'wt');
    fprintf(fid,"; Mnist property with label: %d.\n",label);
    fprintf(fid,"\n");

    %Declare input variables.
%     for i=1:28
%         for j = 1:28
%             fprintf(fid,'(declare-const X_%d_%d Real)\n',i,j);
%         end
%     end
    for i=1:28*28
        fprintf(fid,'(declare-const X_%d Real)\n',i-1);
    end
    fprintf(fid,"\n");

    %Declare output variables.
    for i=1:10
        fprintf(fid,'(declare-const Y_%d Real)\n',i-1);
    end
    fprintf(fid,"\n");

    %Define input constraints.
    fprintf(fid,'; Input constraints:\n');
%     for i=1:28
%         for j = 1:28
%             fprintf(fid,"(assert (<= X_%d_%d %f))\n",i,j,ub(i,j));
%             fprintf(fid,"(assert (>= X_%d_%d %f))\n",i,j,lb(i,j));
%         end
%     end
    for i=1:28*28
        fprintf(fid,"(assert (<= X_%d %f))\n",i-1,ub(i));
        fprintf(fid,"(assert (>= X_%d %f))\n",i-1,lb(i));
    end
    fprintf(fid,"\n");

    %Define output constraints
    fprintf(fid,'; Output constraints:\n');
    for i=0:9
        if i ~= label
           fprintf(fid,"(assert (>= Y_%d Y_%d}))\n",label,i); 
        end

    end
end