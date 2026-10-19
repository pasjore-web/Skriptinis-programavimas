function varargout = specfunkc(varargin)
if nargin == 1
    varargout{1} = varargin{1}^2;
elseif nargin == 2
    varargout{1}=varargin{1}^2+varargin{2}^3;
    else
    error('Reikia 1 arba 2 kintamuju');
end
end