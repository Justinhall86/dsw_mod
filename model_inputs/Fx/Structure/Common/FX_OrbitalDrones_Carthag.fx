{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "OrbitalDrones",
					"props": {
						"emitShape": "Cylinder",
						"instScale_rand": 0.8,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitRad2": 0.49,
						"lifeTime": 10000000,
						"instOrbitSpeed_rand": [
							0,
							0,
							0.4
						],
						"emitRad1": 1.3,
						"emitOrientation": "Speed",
						"emitRate": 17,
						"simulationSpace": "World",
						"alignAxis": [
							10,
							0,
							0
						],
						"instRotation": [
							0,
							0,
							180
						],
						"maxCount": 17,
						"instScale": 2,
						"speedFactor": 0.7
					},
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 5,
					"children": [
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1
						}
					]
				},
				{
					"type": "emitter",
					"name": "OrbitalDrones",
					"props": {
						"emitShape": "Cylinder",
						"instScale_rand": 0.8,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitRad2": 0.49,
						"lifeTime": 10000000,
						"instOrbitSpeed_rand": [
							0,
							0,
							0.4
						],
						"emitRad1": 1.3,
						"emitOrientation": "Speed",
						"emitRate": 17,
						"simulationSpace": "World",
						"alignAxis": [
							10,
							0,
							0
						],
						"instRotation": [
							0,
							0,
							180
						],
						"maxCount": 17,
						"instScale": 2,
						"speedFactor": 0.7
					},
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 5,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": 0.05,
							"scaleX": 0.3,
							"scaleY": 0.1,
							"scaleZ": 0.2,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 20
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad3.jpg",
										"onDecal": false
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
											0.403921568627451,
											0.403921568627451
										]
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}