import numpy as np
import matplotlib.pyplot as plt

#fid = open('Test_Cnoidal_T2_5_007', 'w')
N = 12000
g = 9.81
h = 0.38
t0 = 0.
tEnd = 60
dt = tEnd/N
t = np.linspace(t0, tEnd, round((tEnd-t0)/dt)+1)

H = 0.07
T = 2.5
f = 1/T

omega = 2*np.pi*f

#Compute k
k0 = 0.00001
k1 =omega**2/(g*np.tanh(k0*h))

while abs(k1-k0) > 0.0000001:
    k0 = k1
    k1 =omega**2/(g*np.tanh(k0*h))

k = k1
L = 2*np.pi/k

a = H/2
n1 = 0.5*(1+(2*k*h/np.sinh(2*k*h)))
ksi0 = a /((np.tanh(k*h))/n1)

ksi = np.zeros(len(t))
dis_V = np.zeros(len(t))
ksi[0] = ksi0

for i in range(len(t)):
    ksi[i] = np.tanh(t[i])*ksi0*(np.cos(omega*t[i]) + (0.5*a/h*1/n1*(3/(4*(np.sinh(k*h)**2)) - n1/2)*np.sin(2*omega*t[i])))
    if t[i]>=(tEnd - 5):
        tt = t[i] - tEnd
        ksi[i] = -np.tanh(tt)*ksi0*(np.cos(omega*t[i]) + (0.5*a/h*1/n1*(3/(4*(np.sinh(k*h)**2)) - n1/2)*np.sin(2*omega*t[i])))

for i in range(len(ksi)):
    d = (ksi[i]/0.0415) + 5.5
    #fid.write('{0:.4f}\n'.format(d))
    dis_V[i] = d
#fid.close()

plt.plot(t,dis_V)
plt.title('Piston wavemaker movement')
plt.xlabel('t[s]')
plt.ylabel('displacement[V]')
plt.grid(True)
plt.show()

plt.plot(t,ksi,'r')
plt.title('Surface elevation')
plt.xlabel('t[s]')
plt.ylabel(r'$\eta$[m]')
plt.show()

#V = np.diff(ksi)
#A = np.diff(V)
#plt.plot(t[:-1],V)
#plt.plot(t[:-2],A)
#plt.show()
