import numpy as np
import matplotlib.pyplot as plt
#fid = open('wavemakerMovement_groupT2_H04_test3', 'w')
C = 2
h = 0.5
H = 0.04
g = 9.81

# Wave 1.
T1 = 1*C
f1 = 1/T1
w1 = 2*np.pi*f1

#Compute k1
k0 = 0.0001
k1_ = w1**2/(g*np.tanh(k0*h))

while abs(k1_-k0) > 0.0000001:
    k0 = k1_
    k1_ = w1**2/(g*np.tanh(k0*h))

k1 = k1_


# Wave 2.
T2 = 1.2*C
f2 = 1/T2
w2 = 2*np.pi*f2

#Compute k2
k0 = 0.0001
k2_ = w2**2/(g*np.tanh(k0*h))

while abs(k2_-k0) > 0.0000001:
    k0 = k2_
    k2_ = w2**2/(g*np.tanh(k0*h))

k2 = k2_

N = 18000
t0 = 0.
tEnd = 90
dt = tEnd/N
t = np.linspace(t0, tEnd, round((tEnd-t0)/dt)+1)

phase0 = 0.
direction = 0.

nPaddles = 1
bLims = [0., 0.]


coords = np.linspace(bLims[0], bLims[1], nPaddles+1)
coords = coords[:-1] + np.diff(coords)/2.

HoS1 = 4. * np.sinh(k1*h)**2. / (np.sinh(2.*k1*h) + 2.*k1*h)
HoS2 = 4. * np.sinh(k2*h)**2. / (np.sinh(2.*k2*h) + 2.*k2*h)
HoS = (HoS1 + HoS2)/2
S = H/HoS

X = []
XX = []

ksi = np.zeros(len(t))
eta = np.zeros(len(t))

for i in range (len(t)):

    ksi1 = np.tanh(t[i])*S/2*np.cos(k1 * 0 - w1 * t[i] + np.pi/2 )
    ksi2 = np.tanh(t[i])*S/2*np.cos(k2 * 0 - w2 * t[i] + np.pi/2)
    ksi[i] = ksi1 + ksi2
    V = np.diff(ksi)
    A = np.diff(V)

    eta1 = np.tanh(t[i])*H/2*np.cos(k1 * 0 - w1 * t[i] )
    eta2 = np.tanh(t[i])*H/2*np.cos(k2 * 0 - w2 * t[i] )
    eta[i] = eta1 + eta2


for i in range(len(ksi)):
    x = (ksi[i]/0.0415)+5.5
    #fid.write('{0:.4f}\n'.format(x))
    X.append(x)
#fid.close()

#V = np.diff(X)
#A = np.diff(V)


NN = len(ksi)
t1  = t[0:NN]

plt.plot(t1,X,'b')
plt.title('Surface displacement')
plt.xlabel('t[s]')
plt.ylabel(r'$\xi$[V]')
plt.grid(True)
plt.show()

"""
plt.plot(t1,ksi,'b')
plt.plot(t1,eta,'k')
plt.show()
plt.plot(V,'b')
plt.plot(A,'r')
plt.show()
"""
