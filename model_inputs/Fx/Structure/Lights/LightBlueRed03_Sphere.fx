{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "blue",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "model",
							"name": "SphereIco",
							"source": "Fx/Meshes_Common/SphereIco_Opti.fbx",
							"scaleX": 1.019302682186537,
							"scaleY": 1.019302682186537,
							"scaleZ": 1.019302682186537,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "Back",
											"emissive": 1
										}
									},
									"color": [
										0,
										0.2823529411764706,
										1,
										1
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.14,
										"scale": 1,
										"power": 0.66,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.08,
											"value": 1.0362847222222222,
											"mode": 2
										},
										{
											"time": 0.22500000000000003,
											"value": 0.9417534722222223,
											"mode": 2
										},
										{
											"time": 0.42,
											"value": 1.029982638888889,
											"mode": 2
										},
										{
											"time": 0.5599999999999999,
											"value": 0.9711631944444445,
											"mode": 2
										},
										{
											"time": 0.6849999999999999,
											"value": 1.029982638888889,
											"mode": 2
										},
										{
											"time": 0.84,
											"value": 0.9438541666666668,
											"mode": 2
										},
										{
											"time": 0.9199999999999999,
											"value": 1.067795138888889,
											"mode": 2
										},
										{
											"time": 1.125,
											"value": 0.9480555555555557,
											"mode": 2
										},
										{
											"time": 1.3,
											"value": 1.0425868055555556,
											"mode": 2
										},
										{
											"time": 1.53,
											"value": 0.9564583333333334,
											"mode": 2
										},
										{
											"time": 1.7,
											"value": 1.0278819444444445,
											"mode": 2
										},
										{
											"time": 1.865,
											"value": 0.9270486111111111,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 1.5,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 3,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
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
						"range": 3,
						"power": 52.27
					},
					"isInstance": true
				},
				{
					"type": "object",
					"name": "red",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "model",
							"name": "SphereIco",
							"source": "Fx/Meshes_Common/SphereIco_Opti.fbx",
							"scaleX": 1.019302682186537,
							"scaleY": 1.019302682186537,
							"scaleZ": 1.019302682186537,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "Back",
											"emissive": 1
										}
									},
									"color": [
										1,
										0,
										0,
										1
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.14,
										"scale": 1,
										"power": 0.66,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.08,
											"value": 1.0362847222222222,
											"mode": 2
										},
										{
											"time": 0.22500000000000003,
											"value": 0.9417534722222223,
											"mode": 2
										},
										{
											"time": 0.42,
											"value": 1.029982638888889,
											"mode": 2
										},
										{
											"time": 0.5599999999999999,
											"value": 0.9711631944444445,
											"mode": 2
										},
										{
											"time": 0.6849999999999999,
											"value": 1.029982638888889,
											"mode": 2
										},
										{
											"time": 0.84,
											"value": 0.9438541666666668,
											"mode": 2
										},
										{
											"time": 0.9199999999999999,
											"value": 1.067795138888889,
											"mode": 2
										},
										{
											"time": 1.125,
											"value": 0.9480555555555557,
											"mode": 2
										},
										{
											"time": 1.3,
											"value": 1.0425868055555556,
											"mode": 2
										},
										{
											"time": 1.53,
											"value": 0.9564583333333334,
											"mode": 2
										},
										{
											"time": 1.7,
											"value": 1.0278819444444445,
											"mode": 2
										},
										{
											"time": 1.865,
											"value": 0.9270486111111111,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
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
									"loop": true,
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
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										},
										{
											"time": 3,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
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
	]
}