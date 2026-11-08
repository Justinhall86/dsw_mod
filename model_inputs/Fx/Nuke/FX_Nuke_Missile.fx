{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 1000,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Reactor_1",
					"props": {
						"emitType": "Burst",
						"instScale": 0.5,
						"speedFactor": 0.1,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 0,
						"instOrbitSpeed": [
							0,
							0,
							5
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed": [
							470,
							-280,
							-800
						],
						"instOffset": [
							-3,
							0,
							0
						],
						"instStretch": [
							0.5,
							1,
							1
						]
					},
					"x": -20,
					"y": 34,
					"z": 150,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": -90,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.4,
							"rotationY": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.2,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.87,
										"color": [
											0.16470588235294117,
											0.3411764705882353,
											1
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instWorldSpeed.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -25.912967588841756,
										"dt": -0.46898751598257404
									},
									"nextHandle": {
										"dv": -1.4499999999999993,
										"dt": 0.1798446755721586
									}
								},
								{
									"time": 0.2593077046733138,
									"value": 17,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Reactor_2",
					"props": {
						"emitType": "Burst",
						"instScale": 0.6,
						"speedFactor": 0.1,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 0,
						"instOrbitSpeed": [
							0,
							0,
							5
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed": [
							470,
							-280,
							-800
						],
						"instOffset": [
							-5,
							0,
							0
						],
						"instStretch": [
							0.8,
							0.7,
							0.7
						]
					},
					"x": -20,
					"y": 34,
					"z": 150,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": -90,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.4,
							"rotationY": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 20
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.12,
										"saturation": 1,
										"width": 0.59,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.24,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
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
											1,
											0.27058823529411763,
											0.0784313725490196
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instWorldSpeed.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -25.912967588841756,
										"dt": -0.46898751598257404
									},
									"nextHandle": {
										"dv": -1.4499999999999993,
										"dt": 0.1798446755721586
									}
								},
								{
									"time": 0.2593077046733138,
									"value": 17,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Flare",
					"props": {
						"emitType": "Burst",
						"instScale": 30,
						"speedFactor": 0.1,
						"emitShape": "Cone",
						"emitAngle": 0,
						"instOrbitSpeed": [
							0,
							0,
							5
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed": [
							470,
							-280,
							-800
						],
						"instOffset": [
							1,
							-5,
							0
						],
						"alignMode": "Screen",
						"instRotation": [
							0,
							0,
							10
						]
					},
					"x": -20,
					"y": 34,
					"z": 150,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": -90,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.61,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.12,
										"saturation": 1,
										"width": 0.59,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.24,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
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
											1,
											0.4588235294117647,
											0.12156862745098039
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 40,
										"power": 1
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instWorldSpeed.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -25.912967588841756,
										"dt": -0.46898751598257404
									},
									"nextHandle": {
										"dv": -1.4499999999999993,
										"dt": 0.1798446755721586
									}
								},
								{
									"time": 0.24050999886443836,
									"value": 17,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "NightEmissive",
					"source": "shaders/NightEmissive.hx",
					"props": {
						"amount": 0.5,
						"ATTENUATE": true,
						"emissiveMap": "Fx/Gradients/z_FillOrange.png"
					}
				},
				{
					"type": "emitter",
					"name": "MeshMissile",
					"props": {
						"emitType": "Burst",
						"instScale": 0.15,
						"instRotation": [
							0,
							90,
							0
						],
						"speedFactor": 0.1,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 0,
						"instOrbitSpeed": [
							0,
							0,
							5
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed": [
							470,
							-280,
							-800
						]
					},
					"x": -20,
					"y": 34,
					"z": 150,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": -89.99999999999999,
					"children": [
						{
							"type": "model",
							"name": "Missile",
							"source": "Fx/Meshes_Common/Missile.fbx",
							"rotationZ": 180,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false
										}
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instWorldSpeed.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -25.912967588841756,
										"dt": -0.46898751598257404
									},
									"nextHandle": {
										"dv": -1.4499999999999993,
										"dt": 0.1798446755721586
									}
								},
								{
									"time": 0.2593077046733138,
									"value": 17,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "Dissolve",
					"source": "shaders/Dissolve.hx",
					"props": {
						"progress": 0.5,
						"saturation": 1,
						"width": 1,
						"useAlpha": false
					},
					"children": [
						{
							"type": "curve",
							"name": "progress",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -3.3204498243571012,
										"dt": -0.391555423749147
									},
									"nextHandle": {
										"dv": 0.9000000000000006,
										"dt": 0.10607376924249363
									}
								},
								{
									"time": 0.18411065386374043,
									"value": 1.0000000000000007,
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