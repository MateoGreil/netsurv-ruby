module NetSurv

  autoload :Device, "#{::NetSurv::ROOT}/netsurv/device"

  # This is the camera class : it handle all camera functions
  class Camera < Device; end
end
