import numpy as np
import matplotlib.pyplot as plt

#fid = open('Soliton_02_use', 'w')

eps = 0.2
h = 0.25
g = 9.81
A = eps*h
B_r = 2*np.sqrt(3*A/(4*h**2*(A+h)))
N = 12000
c_r = np.sqrt(g*(A+h))
t = np.linspace(-5,25,N+1)
t_ = np.linspace(0,25,N+1)
t0 = 0
k = np.sqrt(3*eps/(4*h**3))


ksi = np.zeros(len(t))
dis_V = np.zeros(len(t))

for i in range(len(t)):
    ksi[i] = 2*A/(h*B_r)*h*np.tanh(B_r*c_r*t[i]/2)/(h+(A*(1-(np.tanh(B_r*c_r*t[i]/2))**2)))

    if t[i] > (t[-1] - 10):
        t1 = (t[-1] - 10)-(t[i]-6)
        ksi[i] = np.tanh(t1)*2*A/(h*B_r)*h*np.tanh(B_r*c_r*t[i]/2)/(h+(A*(1-(np.tanh(B_r*c_r*t[i]/2))**2)))


for i in range(len(ksi)):
    d = (ksi[i]/0.0415) + 5.5
    #fid.write('{0:.4f}\n'.format(d))
    dis_V[i] = d
#fid.close()


eta = eps/(np.cosh(k*c_r*(t-t0)))**2
V = np.diff(ksi)
A = np.diff(V)


plt.plot(t,dis_V)
plt.title('Piston wavemaker movement')
plt.xlabel('t[s]')
plt.ylabel('displacement[V]')
plt.grid(True)
plt.show()

plt.plot(t,eta,'r')
plt.title('Surface elevation')
plt.xlabel('t[s]')
plt.ylabel(r'$\eta$[m]')
plt.show()

#V = np.diff(ksi)
#A = np.diff(V)
#plt.plot(t[:-1],V)
#plt.plot(t[:-2],A)
#plt.show()
