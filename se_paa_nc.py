import xarray as xr
from mmd_utils.checkMMD.py import checkMMD

f = xr.open_dataset("../TaraMeteo_AWS_Apr07.nc")

print(f)