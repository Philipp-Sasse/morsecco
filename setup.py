from setuptools import setup

setup(
    name='morsecco',
    version='0.5',    
    description='A minimalistic, but mighty programming language',
    url='https://github.com/Philipp-Sasse/morsecco',
    author='Philipp Sasse',
    author_email='Philipp.Sasse@sonnenkinder.org',
    license='BSD 2-clause',
    packages=['morsecco'],
    install_requires=[
                      ],

    classifiers=[
        'Development Status :: 3 - Alpha',
	'Environment :: Console',
	'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',  
        'Operating System :: OS Independent',
	'Operating System :: MacOS :: MacOS X',
	'Operating System :: POSIX :: Linux',        
	'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
	'Topic :: Software Development :: Interpreters',
    ],
)
