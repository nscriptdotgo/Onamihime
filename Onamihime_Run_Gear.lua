function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir','Lionheart','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
        ammo="Aqreaqa Bomblet",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Futhark Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Warwolf belt",
		ear1="Ethereal Earring",
		ear2="Cryptic Earring",
		ring1="Gelatinous Ring +1",
		ring2="Odium Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}},
        }
		 
    sets.Enmity.SIRD = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Trux Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}
		
    sets.Enmity.SIRDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

    sets.Enmity.DT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Futhark Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +2",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
		body="Runeist's Coat +2",
		legs="Futhark Trousers +1",
		back=gear.RUN_FC_Cape,
		})    
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +2"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One for All'] = set_combine(sets.Enmity, {
	    head="Runeist's Bandeau +2", --99
        body="Runeist's Coat +2", --208
        hands="Turms Mittens +1", --74
		--hands="Regal Gauntlets", --205
        legs="Futhark Trousers +1", --87
		feet="Runeist Bottes +1", --64
        neck="Veisa Collar", --6/6
        ear1="Odnowa Earring +1", --100
        ear2="Ethereal Earring", --100
		--ear1="Tuisto Earring",
		ring2="Gelatinous Ring +1", --70
        ring1="Epona's Ring", --110
        back="Ogma's cape", --6/6
        waist="Flume Belt +1",
        })
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
        --ammo="Pemphredo Tathlum",
        head="Herculean Helm", --10
        --body="Samnuha Coat", --30
        hands="Taeon Gloves", --42
        legs="Shneddick tights +1", --20
        --feet="Herculean Boots", --10
        neck="Sanctity Necklace", --13
        ear1="Hecate's Earring", --6
        ear2="Friomisi Earring", --10
		--ring1="Stikini Ring +1",
		ring2="Acumen Ring",
        --ring2="Fenrir Ring +1",
        --back="Evasionist's Cape",
        --waist="Eschan Stone",
    }
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
        head="Erilaz Galea +1",
        legs="Runeist Trousers +1",
        neck="Henic Torque",
        --ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
        --waist="Bishop's Sash",
        --back="Altruistic Cape",
    })
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {main="Malignance Sword",sub="Chanter's Shield",ammo="Impatiens",
            head="Rune. Bandeau +3",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.precast.FC.DT = {main="Malignance Sword",sub="Chanter's Shield",ammo="Impatiens",
        head="Rune. Bandeau +3",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Audumbla Sash",legs="Eri. Leg Guards +1",feet="Carmine Greaves +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
        ammo="Knobkierrie",
        head="Adhemar Bonnet",
        body="Herculean Vest",
		hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
		feet="Herculean Boots",
        neck="Light Gorget",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
		ring1="Llabrat Ring",
		ring2="Rajas Ring",
		back=gear.stp_jse_back,
        waist="Light Belt",
    }
	-- sets.precast.WS.SomeAcc = {ammo="Voluspa Tathlum",
    --         head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
    --         back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	-- sets.precast.WS.Acc = {ammo="C. Palug Stone",
    --         head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
    --         back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	-- sets.precast.WS.HighAcc = {ammo="C. Palug Stone",
    --         head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
    --         back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	-- sets.precast.WS.FullAcc = {ammo="C. Palug Stone",
    --         head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
    --         body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
    --         back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
        ammo="Staunch Tathlum",
        head="Rune. Bandeau +2", --14
		body="Taeon Tabard",
        hands="Taeon Gloves", --7
        legs="Ayanmo Cosciales +2", --6
        feet="Carmine Greaves", --8
        --neck="Voltsurge Torque", --4
        ear1="Etiolation Earring", --1
        ear2="Loquac. Earring",
        --ring1="Moonlight Ring",
		--back=gear.RUN_FC_Cape, --10
        --waist="Rumination Sash",
        }
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
		head="Fu. Bandeau +1",
		neck="Futhark Torque",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
		body="Runeist's Coat +2",
		hands=gear.herculean_dt_hands,
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		-- back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"
	}
		
	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{main="Pukulatmuj +1",head="Erilaz Galea +1",neck="Henic Torque",ear1="Andoaa Earring",ear2="Mimir Earring",hands="Runeist's Mitons +2",back="Merciful Cape",waist="Olympus Sash",legs="Futhark Trousers +1"})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Deacon Sword",head="Futhark Bandeau +1",hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +3",neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
        ammo="Staunch Tathlum",
        --head=gear.Herc_DT_head,
        --body="Vrikodara Jupon", -- 13
        --hands="Buremte Gloves", --(13)
        legs="Aya. Cosciales +2",
        --feet="Skaoi Boots", --7
        --neck="Phalaina Locket", -- 4(4)
		neck="Henic Torque",
        --ear1="Roundel Earring", -- 5
        --ear2="Mendi. Earring", -- 5
		--ring1="Stikini Ring +1",
        --ring2="Stikini Ring +1",
        --back="Solemnity Cape", -- 7
        --waist="Gishdubar Sash", --(10)
        }
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Erilaz Galea +1"})
	sets.Phalanx_Received = {main="Deacon Sword",hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
        ammo="Staunch Tathlum",
		head="Runeist's Bandeau +2",
		body="Runeist's Coat +2",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal Earring",
		left_ring="Paguroidea Ring",
		right_ring="Defending Ring",
		back="Ogma's cape",
    }
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonlight Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.idle.KiteTank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {main="Aettir",sub="Utu Grip",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +3",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_refresh_feet}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {
        ammo="Staunch Tathlum", --2/2
        head="Fu. Bandeau +1", --6/0
        body="Futhark Coat +3", --9/9
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}},
    }
	sets.defense.PDT_HP = {
        --sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Runeist's Bandeau +3", --99
        body="Runeist's Coat +3", --208
        hands="Turms Mittens +1", --74
        legs="Futhark Trousers +3", --87
		feet="Runeist Bottes +1", --64
        neck="Futhark Torque +1", --6/6
        ear1="Odnowa Earring", --100
        ear2="Odnowa Earring +1", --100
		ring1="Moonlight Ring", --110
        ring2="Defending Ring", --10/10
        back="Moonbeam Cape", --5/5 250
		waist="Flume Belt",
    }
	sets.defense.MDT = {
        ammo="Staunch Tathlum", --2/2
        head="Futhark Bandeau +1", --6/0
        body="Futhark Coat +3",
        hands="Turms Mittens +1",
        legs="Erilaz Leg Guards +1", --7/0
        feet="Erilaz Greaves +1", --5/0
		neck="Futhark Torque +1", --6/6
        ear1="Etiolation Earring", --0/3
        ear2="Odnowa Earring +1", --0/2
        ring1="Shadow Ring", --5/5
		ring2="Defending Ring", --10/10
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}},        
        waist="Flume Belt +1", --4/0
    }
	sets.defense.MDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	-- sets.defense.BDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	-- sets.defense.BDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
    --     body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
    --     back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	-- sets.defense.MEVA = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
    --     back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	-- sets.defense.MEVA_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
    --     back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	-- sets.defense.Death = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
    --     back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}

	-- sets.defense.DTCharm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
    --     back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	-- sets.defense.Charm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
    --     head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
    --     body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
    --     back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Moonshade Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
        sub="Refined Grip +1",
		ammo="Ginsen",
		head="Adhemar Bonnet",
		body="Herculean Vest",
		hands="Adhemar Wristbands",
		legs="Meg. Chausses +2",
		feet="Carmine Greaves",
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
    }
    sets.engaged.SomeAcc = {
        ammo="Yamarang",
		head="Ayanmo Zucchetto +2",
        }
	sets.engaged.Acc = {
		legs="Meghanada Chausses +2", --+29
		waist="Kentarch Belt +1", --+2
        }
	sets.engaged.HighAcc = {
		neck="Combatant's Torque", --+10
		ring1="Moonlight Ring", --+8
		ring2="Chirich Ring +1", --+7
        }
	-- sets.engaged.FullAcc = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
    --         back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
    -- sets.engaged.DTLite = {main="Lionheart",sub="Utu Grip",ammo="Yamarang",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
    -- sets.engaged.SomeAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	-- sets.engaged.Acc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonlight Cape",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	-- sets.engaged.HighAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	-- sets.engaged.FullAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Mache Earring +1",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
    sets.engaged.Tank = {
        ammo="Staunch Tathlum", --2/2
        head="Fu. Bandeau +1", --6/0
        body="Futhark Coat +3", --9/9
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}},
    }
	sets.engaged.Tank_HP = {
        --sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Runeist's Bandeau +3", --99
        body="Runeist's Coat +3", --208
        hands="Turms Mittens +1", --74
        legs="Futhark Trousers +3", --87
		feet="Runeist Bottes +1", --64
        neck="Loricate Torque +1", --6/6
        ear1="Odnowa Earring", --100
        ear2="Odnowa Earring +1", --100
		ring1="Moonlight Ring", --110
        ring2="Eihwaz Ring", --70
        back="Moonbeam Cape", --5/5 250
		waist="Flume Belt",
    }
    sets.engaged.SomeAcc.Tank = set_combine(sets.engaged.Tank, {
        ammo="Yamarang",
		head="Ayanmo Zucchetto +2",
    })
	sets.engaged.Acc.Tank = set_combine(sets.engaged.Tank, {
		legs="Meghanada Chausses +2", --+29
		waist="Kentarch Belt +1", --+2
    })
	sets.engaged.HighAcc.Tank = set_combine(sets.engaged.Tank, {
		neck="Combatant's Torque", --+10
		ring1="Moonlight Ring", --+8
		ring2="Chirich Ring +1", --+7
        })
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {ring1="Eshmun's Ring", ring2="Eshmun's Ring", waist="Gishdubar Sash"})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 19)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 19)
	elseif player.sub_job == 'SCH' then
		set_macro_page(5, 19)
	elseif player.sub_job == 'BLU' then
		set_macro_page(6, 19)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 19)
	elseif player.sub_job == 'SAM' then
		set_macro_page(8, 19)
	elseif player.sub_job == 'DRK' then
		set_macro_page(9, 19)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 19)
	else
		set_macro_page(5, 19)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 034')
	else
		windower.chat.input('/lockstyleset 033')
	end
end