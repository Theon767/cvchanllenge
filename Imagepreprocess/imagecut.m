function [cut1,cut2]=imagecut(pic1,pic2)
[row,col]=find(pic1);
minrow=min(row);
mincol=min(col);
maxrow=max(row);
maxcol=max(col);
cut1=pic1(minrow:maxrow,mincol:maxcol);
cut2=pic2(minrow:maxrow,mincol:maxcol);
end