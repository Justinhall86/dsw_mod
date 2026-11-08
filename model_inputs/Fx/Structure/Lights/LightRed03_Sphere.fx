{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"props": {
				"tag": "TURN OFF BEFORE SAVE"
			},
			"rotationZ": -100.8,
			"children": [
				{
					"type": "light",
					"name": "light_0",
					"x": 3.999999999999999,
					"y": 3.37,
					"z": 4,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
					"power": 0.08,
					"range": 100,
					"size": 50,
					"zNear": 0.02,
					"debugDisplay": false
				},
				{
					"type": "light",
					"name": "light_1",
					"x": -6.35,
					"y": -10.13,
					"z": 11.15,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
					"color": 16761253,
					"power": 0.2,
					"range": 200,
					"size": 80,
					"zNear": 0.02,
					"debugDisplay": false
				},
				{
					"type": "model",
					"name": "SupplyDepot",
					"source": "Structure/Buildings/SupplyDepot/SupplyDepot.fbx",
					"rotationZ": 100.8,
					"animation": "Structure/Buildings/SupplyDepot/Anim_SupplyDepot.fbx"
				},
				{
					"type": "polygon",
					"name": "polygon",
					"z": -0.01,
					"scaleX": 20,
					"scaleY": 20,
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
									"shadows": true,
									"culling": true,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"textureWrap": true
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Environment/Texture/Ground/Rock/Ground_Rock_01_basecolor.png",
							"normalMap": "Environment/Texture/Ground/Rock/Ground_Rock_01_normal.png"
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 5,
								"scaleY": 5,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true
						}
					]
				}
			],
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Light03",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "model",
							"name": "SphereIco",
							"source": "Fx/Meshes_Common/SphereIco.fbx",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"culling": true,
											"emissive": 0.5
										}
									},
									"color": [
										1,
										0.9882352941176471,
										0.8588235294117647,
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
											"time": 0.105,
											"value": 1.067795138888889,
											"mode": 2
										},
										{
											"time": 0.265,
											"value": 0.9711631944444445,
											"mode": 2
										},
										{
											"time": 0.335,
											"value": 1.0362847222222222,
											"mode": 2
										},
										{
											"time": 0.41500000000000004,
											"value": 0.9312500000000001,
											"mode": 2
										},
										{
											"time": 0.6849999999999999,
											"value": 1.029982638888889,
											"mode": 2
										},
										{
											"time": 0.855,
											"value": 0.9102430555555556,
											"mode": 2
										},
										{
											"time": 1.0799999999999998,
											"value": 1.067795138888889,
											"mode": 2
										},
										{
											"time": 1.295,
											"value": 0.9480555555555557,
											"mode": 2
										},
										{
											"time": 1.435,
											"value": 1.0341840277777778,
											"mode": 2
										},
										{
											"time": 1.53,
											"value": 0.9564583333333334,
											"mode": 2
										},
										{
											"time": 1.635,
											"value": 1.0698958333333335,
											"mode": 2
										},
										{
											"time": 1.895,
											"value": 0.935451388888889,
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
							"type": "model",
							"name": "SphereIco",
							"source": "Fx/Meshes_Common/SphereIco.fbx",
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
											"culling": true,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 3,
								"power": 52.27
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}