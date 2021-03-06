function r=smooth(fixed_points,res_max,ratio)
  if ~exist('ratio','var'), ratio=1.3; end
  r=arrayfun(@(s,e,p,n) smooth_segment([s,e],p,n,res_max,ratio),...
            fixed_points(1:end-1),...
            fixed_points(2:end),...
            [res_max diff(fixed_points)(1:end-1)],...
            [diff(fixed_points)(2:end) res_max],...
            'UniformOutput',false);
  r=cell2mat(r);
  r=sort(unique(r));
end
