{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "group",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"x": -0.69542,
					"y": 0.06429,
					"scaleX": 10,
					"scaleY": 10,
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
									"mode": "PBR",
									"blend": "None",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/vGrad.png",
							"normalMap": "Fx/DistortionMaps/water-normal.png",
							"color": [
								0.6588235294117647,
								0.30196078431372547,
								0,
								1
							]
						},
						{
							"type": "shader",
							"name": "ColorMap",
							"source": "shaders/ColorMap.hx",
							"props": {
								"USE_ALPHA": false,
								"colorA": [
									0.6901960784313725,
									0.33725490196078434,
									0
								],
								"pointA": 0,
								"colorB": [
									0.615686274509804,
									0.26666666666666666,
									0.26666666666666666
								],
								"pointB": 1
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "light",
					"name": "light_1",
					"y": -1.26,
					"z": 0.77,
					"color": 14079702,
					"power": 0.45,
					"occlusionFactor": 0,
					"range": 5.61,
					"zNear": 0.02
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "DustClouds",
					"props": {
						"emitType": "Burst",
						"burstParticleCount": 5,
						"alignMode": "Screen",
						"emitOrientation": "Normal",
						"instSpeed": [
							1,
							0,
							0
						]
					},
					"children": [
						{
							"type": "model",
							"name": "Plane",
							"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
							"rotationY": 90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0,
										0,
										1
									]
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Burst01",
					"props": {},
					"children": [
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									}
								}
							]
						}
					]
				}
			]
		}
	]
}