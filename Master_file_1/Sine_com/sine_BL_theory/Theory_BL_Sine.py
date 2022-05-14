import numpy as np
import csv
g = 9.81
#H = np.array([0.073, 0.070, 0.065, 0.111, 0.129, 0.137])
a = np.array([0.043, 0.037, 0.035, 0.061, 0.075, 0.082])
#a = H/2
T = np.array([2, 1.43, 1.11, 1.11, 1.43, 2])
f = 1/T
h = 0.5
nu = 1.0035e-6
z = np.linspace(0,0.018,501)
nr = np.array([25, 28, 31, 34, 37, 40])
#u_BL = np.zeros((6,len(z)))

for j in range(len(T)):
    omega = 2*np.pi*f[j]
    delt =np.sqrt(2*nu/omega)

    k0 = 0.00001
    k1 =omega**2/(g*np.tanh(k0*h))

    while abs(k1-k0) > 0.0000001:
        k0 = k1
        k1 =omega**2/(g*np.tanh(k0*h))

    k = k1

    U1_ = a[j]*omega*np.cosh(k*((delt-h)+h))*np.cos(0)/np.sinh(k*h)
    u = U1_*(np.sin(np.pi/2) - np.exp(-z/delt)*np.sin(np.pi/2 - (z/delt)))
    #u = U1_*np.sin(np.pi/2) - U1_*np.exp(-z/delt)*np.sin(np.pi/2 - (z/delt))
    name = "BL_theory_%s.csv" % (nr[j])
    with open(name, 'w') as data:
        writer = csv.writer(data, delimiter='\t')
        writer.writerows(zip(u,z))
quit()
