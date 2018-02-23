# Create the data.
import pylab as pl
import numpy as np
dphi, dtheta = np.pi/250.0, np.pi/250.0
#[phi,theta] = np.mgrid[0:np.pi+dphi*1.5:dphi,0:2*np.pi+dtheta*1.5:dtheta]
#m0 = 4; m1 = 3; m2 = 2; m3 = 3; m4 = 6; m5 = 2; m6 = 6; m7 = 4;

c=2.0
a=1.0


[nu,u] = np.mgrid[0:2*np.pi+dphi*1.5:dphi,0:2*np.pi+dtheta*1.5:dtheta]
x = (c+a*np.cos(nu))*np.cos(u)
y = (c+a*np.cos(nu))*np.sin(u)
z = a*np.sin(nu)

num_rings = 20
t1 = np.linspace(0,2*np.pi,200)

# View it.
from mayavi import mlab
s = mlab.mesh(x, y, z)

for i in range(num_rings):
    t2 = np.zeros(200) + i*2*pl.pi/num_rings
    mlab.plot3d((c+a*np.cos(t1))*np.cos(t2), (c+a*np.cos(t1))*np.sin(t2),  a*np.sin(t1),
            color=(.1,.1,.1),tube_radius=.03)
    mlab.plot3d((c+a*np.cos(t2))*np.cos(t1), (c+a*np.cos(t2))*np.sin(t1),  a*np.sin(t2), color=(.1,.1,.1))


#s = mlab.mesh(x, y, -z)
mlab.show()
