{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "model",
			"name": "FuelCellFactory",
			"source": "Structure/Buildings/FuelCellFactory.fbx",
			"x": -1.64,
			"rotationZ": 180,
			"animation": "Structure/Buildings/Anim_FuelCellFactory.fbx",
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Sphere_02",
					"source": "Fx/Structure/HeatWindDisto/Sphere_02.fbx",
					"z": 0.99,
					"scaleZ": 2,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Distortion",
									"blend": "Add",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"culling": true
								}
							}
						},
						{
							"type": "shader",
							"name": "DistortionMap",
							"source": "shaders/DistortionMap.hx",
							"props": {
								"distortionDir": "Fx/Structure/HeatWindDisto/water-normal.png",
								"intensity": 0.02
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 3,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": -0.3
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": false,
								"ALPHA": true,
								"REVERSE": true,
								"bias": 0,
								"scale": 1,
								"power": 0.03,
								"color": [
									0,
									0,
									0
								]
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
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.11,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl03u_A.jpg"
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}