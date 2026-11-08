{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 40,
			"scaleY": 40,
			"scaleZ": 40,
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Big_1",
					"props": {
						"lifeTime": 7,
						"alignMode": "Screen",
						"instScale_rand": 0.3,
						"maxCount": 100,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"simulationSpace": "World",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0.1,
						"randomColor1": [
							1,
							1,
							0.9490196078431372,
							1
						],
						"randomColor2": [
							0.803921568627451,
							0.803921568627451,
							0.803921568627451,
							0.7294117647058823
						],
						"emitRate": 4,
						"lifeTimeRand": 0.5,
						"instSpeed": [
							0.03,
							0,
							0.04
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"useRandomColor": true,
						"enableSort": false,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitOrientation": "Normal",
						"emitShape": "Cylinder",
						"animationLoop": false,
						"speedFactor": 0.6
					},
					"z": 0.15,
					"scaleZ": 0.1,
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
											"alphaKill": false,
											"parallax": 0,
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
										"scale": 3
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.052118579484834636
													}
												},
												{
													"time": 0.34500000000000003,
													"value": 1.0053703703703702,
													"mode": 1,
													"prevHandle": {
														"dv": -0.03765432098765431,
														"dt": -0.21000000000000002
													},
													"nextHandle": {
														"dv": 0.028240740740740677,
														"dt": 0.3402408169486359
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.35583333333333317,
														"dt": -0.09170705685108982
													},
													"nextHandle": {
														"dv": -0.2745987514832717,
														"dt": 0.06948931730459196
													}
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8745098039215686,
											0.8745098039215686,
											0.8745098039215686
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
										"progress": 0.55,
										"saturation": 0,
										"width": 2,
										"uvScaleX": 1.5,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0.01
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3283333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3283333333333333
													}
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.61,
									"dirIntensity": 0.6,
									"sandBlend": 0.6,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "lightning",
									"source": "shaders/ColorAdd.hx",
									"props": {
										"amount": 0,
										"color": [
											0.49019607843137253,
											0.7254901960784313,
											1
										],
										"tag": "Used by code"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 1
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.019999999999999997,
									"value": 0.7850000000000001,
									"mode": 2
								},
								{
									"time": 0.245,
									"value": 1.0908097451790637,
									"mode": 0,
									"prevHandle": {
										"dv": -0.061403662613847505,
										"dt": -0.08343956833586955
									},
									"nextHandle": {
										"dv": 0.32246091597796145,
										"dt": 0.4385714285714285
									}
								},
								{
									"time": 1,
									"value": 1.5405299586776862,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}