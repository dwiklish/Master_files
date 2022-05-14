import numpy as np
import matplotlib.pyplot as plt

#fid = open('Nwaves_T6_H004_h025_test', 'w')

eps = -1.15
H = 0.04
h = 0.25
x1 = -4
T = 6
g = 9.81


N = 12000
t0 = 0.
tEnd = 60
dt = tEnd/N
t = np.linspace(t0, tEnd, round((tEnd-t0)/dt)+1)


kappa = np.sqrt(3*H/(4*h**3))
delta = 0. #x2-x1
L = 2*np.pi/kappa
c = L/T
ksi_0 = 0.000001

dis = np.zeros(N+1)
ETA = np.zeros(N+1)
dis_V = []
scl = 0.17

for i in range(len(t)):
    phase_0 = kappa*(ksi_0 - c*t[i] - x1)
    ksi_1 = (-eps*H/(kappa*h)*((phase_0 - kappa*delta)*np.tanh(phase_0) - np.log(2*np.cosh(phase_0)+ (kappa*delta))))+scl
    while abs(ksi_1-ksi_0) > 0.00001:
        ksi_0 = ksi_1
        phase_0 = kappa*(ksi_0 - c*t[i] - x1)
        ksi_1 = (-eps*H/(kappa*h)*((phase_0 - kappa*delta)*np.tanh(phase_0) - np.log(2*np.cosh(phase_0)+ (kappa*delta))))+scl


    eta_1 = eps *H *(phase_0 - kappa*delta)*(1/np.cosh(phase_0))**2
    ETA[i] = (eta_1)

    x = ksi_1
    dis[i] = x


for i in range(len(dis)):
    d = (dis[i]/0.0415) + 5.5
    #fid.write('{0:.4f}\n'.format(d))
    dis_V.append(d)
#fid.close()

V = np.diff(dis_V)
A = np.diff(V)

plt.plot(t,dis_V)
plt.title('Piston wavemaker movement')
plt.xlabel('t[s]')
plt.ylabel('displacement[V]')
plt.show()
plt.plot(t,ETA)
plt.title('Surface elevation')
plt.xlabel('t[s]')
plt.ylabel(r'$\eta$[m]')
plt.show()
#plt.plot(V,'b')
#plt.plot(A,'r')
#plt.show()
