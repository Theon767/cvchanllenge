function H=epa(correspondences)
     x1(1:2,:)=correspondences(1:2,:);
     x1(3,:)=1;
     x2(1:2,:)=correspondences(3:4,:);
     x2(3,:)=1;
     x2dach={};
     for i=1:length(x1)
         x2dach{i}=dach(x2(:,i));
     end
     A=kron(x1(:,1),x2dach{1})';
     for i=2:length(x1)
         A=[A;(kron(x1(:,i),x2dach{i}))'];
     end
     [~,~,V]=svd(A);
     G=V(:,9);
     G=reshape(G,[3,3]);
     [U_G,S_G,V_G]=svd(G);
     H=U_G*diag([1 1 0])*S_G*V_G';
end