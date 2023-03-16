function res = GCM(img)
    if(size(img, 3) > 1)
        img = rgb2gray(img);
    end
    img = double(img);
    R_o = 3;
    R_i = 2;
    delta_B = newRingStrel(R_o, R_i);
    B_b = ones(R_i);
    img_dilate = IMdilate(img, delta_B, B_b);
    img_dilate = img_dilate +1;%%��1��Ϊ�˱�������ֵ����0
    res=((img.^2)./img_dilate)-img;
    res(res<0)=0;

function [SE] = newRingStrel(R_o,R_i)
% ������λ�״�ṹԪ��
%   R_o : the radius of out
%   R_i : the radius of inner
%   delta_R = R_o - R_i
    d = 2 * R_o + 1;
    SE = ones(d);
    start_index = R_o + 1 - R_i;
    end_index = R_o +1 + R_i;
    SE(start_index:end_index, start_index:end_index) = 0;
end

function [out] = IMdilate(img, delta_B, B_b)
%   img: �����ͼ��
%   delta_B, B_b: �ṹԪ��
    img_d = imdilate(img, delta_B);    
    out = img_d;
end
end
    
