function [AreaMatric,MeshLocation] = GetAreaAndLocation(faces,vertices)

[number_of_mesh,~] = size(faces);

AreaMatric = zeros(number_of_mesh,1);
MeshLocation = zeros(number_of_mesh,3);

for i = 1:number_of_mesh
    
    A = vertices(faces(i,1),:);
    B = vertices(faces(i,2),:);
    C = vertices(faces(i,3),:);
    
    MeshLocation(i,:) = (A + B + C)/3;

    AreaMatric(i) = 0.5 * norm(cross(B-A,C-A));
    
end

end