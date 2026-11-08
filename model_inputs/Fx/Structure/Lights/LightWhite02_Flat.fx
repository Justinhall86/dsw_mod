{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"enabled": false,
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
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "middle hexagony",
					"scaleX": 0.2,
					"scaleY": 0.16000000000000003,
					"scaleZ": 0.4,
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
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"emissive": 0.5
								}
							},
							"diffuseMap": "Fx/Structure/Lights/circGrad01.png"
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
									"time": 0.09499999999999999,
									"value": 0.95,
									"mode": 2
								},
								{
									"time": 0.21000000000000002,
									"value": 1.04375,
									"mode": 2
								},
								{
									"time": 0.32,
									"value": 0.93125,
									"mode": 2
								},
								{
									"time": 0.5549999999999999,
									"value": 1.0145833333333334,
									"mode": 2
								},
								{
									"time": 0.715,
									"value": 0.9614583333333333,
									"mode": 2
								},
								{
									"time": 0.875,
									"value": 1.04375,
									"mode": 2
								},
								{
									"time": 1.05,
									"value": 0.978125,
									"mode": 2
								},
								{
									"time": 1.2049999999999998,
									"value": 1.0197916666666667,
									"mode": 2
								},
								{
									"time": 1.4,
									"value": 0.9552083333333333,
									"mode": 2
								},
								{
									"time": 1.655,
									"value": 1.0572916666666667,
									"mode": 2
								},
								{
									"time": 1.795,
									"value": 0.9625,
									"mode": 2
								},
								{
									"time": 1.9,
									"value": 1.0208333333333333,
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
				}
			]
		}
	]
}