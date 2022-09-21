import os
import time

os.system("sbatch tool_1000K_es32_alpha085_ns1.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns3.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns5.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns10.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns30.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns50.sh")
time.sleep(3*60*60)
os.system("sbatch tool_1000K_es32_alpha085_ns100.sh")