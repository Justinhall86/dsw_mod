{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "advancedDecal",
			"name": "Flash",
			"scaleX": 400,
			"scaleY": 400,
			"scaleZ": 100,
			"albedoMap": "Fx/Alphas/T_circle2.png",
			"fadePower": 3,
			"fadeStart": 1,
			"fadeEnd": 2,
			"renderMode": "AfterTonemapping",
			"children": [
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
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8420060729980471,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16233005820240903,
										"dt": -0.11904187797929618
									},
									"nextHandle": {
										"dv": 0.16233005820240903,
										"dt": 0.11904187797929618
									}
								},
								{
									"time": 1.0712646484375001,
									"value": 0.8579819444444443,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0026424732873303546,
										"dt": -0.057699464600149984
									},
									"nextHandle": {
										"dv": -0.06666528593540189,
										"dt": 1.3615356445312503
									}
								},
								{
									"time": 4.13994750976563,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.12323267329957743,
										"dt": -0.6900000000000048
									},
									"nextHandle": {
										"dv": -0.13385826535277093,
										"dt": 0.7393088491759993
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
						"amount": 0.7,
						"color": [
							1,
							0.9098039215686274,
							0.611764705882353
						]
					},
					"children": [
						{
							"type": "curve",
							"name": "amount",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.017160493827160492,
									"value": 0.17023174683077483,
									"mode": 2
								},
								{
									"time": 0.21469135802469136,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.11691358024691358
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.12670781893004113
									}
								},
								{
									"time": 0.4754320987654321,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.12670781893004113
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.17829218106995884
									}
								},
								{
									"time": 0.8191358024691358,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.17829218106995884
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.12985596707818928
									}
								},
								{
									"time": 1.249753086419753,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.12985596707818928
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.10403292181069967
									}
								},
								{
									"time": 1.478888888888889,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.10403292181069967
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.11456790123456788
									}
								},
								{
									"time": 1.9529629629629628,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.11456790123456788
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16065843621399178
									}
								},
								{
									"time": 2.3638271604938272,
									"value": 0.6,
									"mode": 2
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Flash",
			"x": 30,
			"scaleX": 2500,
			"scaleY": 2500,
			"scaleZ": 100,
			"albedoMap": "Fx/Alphas/T_circle2.png",
			"fadePower": 2,
			"fadeStart": 1,
			"fadeEnd": 2,
			"renderMode": "AfterTonemapping",
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1.3
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
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8420060729980471,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16233005820240903,
										"dt": -0.11904187797929618
									},
									"nextHandle": {
										"dv": 0.16233005820240903,
										"dt": 0.11904187797929618
									}
								},
								{
									"time": 1.0472375488281251,
									"value": 0.8579819444444443,
									"mode": 0,
									"prevHandle": {
										"dv": 0.002006450736647008,
										"dt": -0.05771221281120726
									},
									"nextHandle": {
										"dv": -0.04622202380952389,
										"dt": 1.3294995117187507
									}
								},
								{
									"time": 3.9717578125000044,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.12423606150793648,
										"dt": -0.7700903320312542
									},
									"nextHandle": {
										"dv": 0.09507488523344862,
										"dt": 0.5750895634637037
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
						"amount": 1,
						"color": [
							1,
							0.6823529411764706,
							0.4823529411764706
						]
					}
				}
			]
		}
	]
}