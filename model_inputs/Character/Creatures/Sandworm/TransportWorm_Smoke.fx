{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "emitter",
			"name": "Fireball_Screen",
			"props": {
				"instScale_rand": 1,
				"maxCount": 80,
				"simulationSpace": "World",
				"animationSpeed": 0,
				"randomColor1": [
					1,
					1,
					1,
					1
				],
				"randomColor2": [
					1,
					0.24313725490196078,
					0.10980392156862745,
					1
				],
				"emitRate": 25,
				"instRotation_rand": [
					0,
					0,
					180
				],
				"frameCount": 32,
				"frameDivisionX": 8,
				"frameDivisionY": 8,
				"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
				"instScale": 12,
				"burstDelay": 0.15,
				"instStretch_rand": [
					0.1,
					0.1,
					0.1
				],
				"burstParticleCount": 4,
				"emitShape": "Cone",
				"emitRad1": 0.83,
				"emitSurface": true,
				"lifeTimeRand": 0.5,
				"alignMode": "Screen",
				"emitAngle": 0,
				"instWorldSpeed_rand": [
					0,
					0,
					0
				],
				"instWorldAcceleration_rand": [
					0,
					0,
					0
				],
				"instSpeed_rand": [
					0,
					0,
					0
				],
				"instAcceleration_rand": [
					0,
					0,
					0
				],
				"warmUpTime": -5,
				"speedFactor": 1.1,
				"lifeTime": 1.5,
				"instOffset": [
					0,
					0,
					1
				]
			},
			"scaleX": 3,
			"scaleY": 3,
			"scaleZ": 3,
			"rotationX": 6.4,
			"rotationY": -36.6,
			"rotationZ": -179.2,
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"kind": 0,
					"args": [
						0
					],
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Back",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": true,
									"parallax": 0,
									"drawOrder": "120",
									"textureWrap": true
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Structure/Smoke/white.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.0050000000000000044,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.039999999999999994,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03710452735505736,
												"dt": -0.03411451044810665
											},
											"nextHandle": {
												"dv": -0.18333333333333335,
												"dt": 0.16907950549334172
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.32
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.32
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 0.8,
								"color": [
									0.8823529411764706,
									0.8823529411764706,
									0.8823529411764706
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.39,
								"saturation": 0,
								"width": 0.4,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4501476276915423,
												"dt": -0.6144515117989549
											},
											"nextHandle": {
												"dv": -0.33333333333333337,
												"dt": 0.455
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.2833333333333333,
												"dt": -0.29500000000000004
											},
											"nextHandle": {
												"dv": -0.40250763363430087,
												"dt": 0.41908147737218393
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "width",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0520769766684747,
												"dt": -0.49993897601734766
											},
											"nextHandle": {
												"dv": -0.06666666666666665,
												"dt": 0.6399999999999999
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "model",
									"name": "Sandworm",
									"source": "Character/Creatures/Sandworm/Sandworm.fbx",
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "Sandworm",
											"source": "Character/Creatures/Sandworm/Sandworm.fbx",
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationZ": 90
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 0.5,
								"power": 0.5
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "fakeLight",
							"name": "fakeLight",
							"props": {},
							"normalMap": "Fx/DistortionMaps/SphereClean.png",
							"topIntensity": 0.42,
							"dirBrighten": true,
							"dirIntensity": 0.22
						}
					]
				},
				{
					"type": "curve",
					"name": "instScale",
					"keyMode": 0,
					"keys": [
						{
							"time": 0,
							"value": 0.2,
							"mode": 0,
							"prevHandle": {
								"dv": -0.7952595244854048,
								"dt": -0.4182858537877781
							},
							"nextHandle": {
								"dv": 0.25666666666666665,
								"dt": 0.135
							}
						},
						{
							"time": 1,
							"value": 0.7,
							"mode": 0,
							"prevHandle": {
								"dv": 0.023333333333333317,
								"dt": -0.20500000000000007
							},
							"nextHandle": {
								"dv": -0.03059224177730227,
								"dt": 0.26877469561486866
							}
						}
					]
				}
			]
		},
		{
			"type": "shader",
			"name": "AlphaMult",
			"source": "shaders/AlphaMult.hx",
			"enabled": false,
			"props": {
				"alpha": 1
			},
			"children": [
				{
					"type": "curve",
					"name": "alpha",
					"keyMode": 0,
					"keys": [
						{
							"time": 0,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 1.0068797792796257e-16,
								"dt": -0.5000381697372671
							},
							"nextHandle": {
								"dv": 0,
								"dt": 0.4561394691467286
							}
						},
						{
							"time": 0.9977599507532349,
							"value": 1,
							"mode": 2
						}
					]
				}
			],
			"isInstance": true
		}
	]
}