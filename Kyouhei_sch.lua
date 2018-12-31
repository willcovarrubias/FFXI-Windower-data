-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    include('Kyouhei-Include.lua')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
	send_command('alias MMPP input /ws "Myrkr"; input /echo  Myrkr ;')
	send_command('alias mirrors input /item "Mirror\'s Tonic"; input /echo  Petrify screen;')
	send_command('alias terror input /item "Steadfast Tonic"; input /echo  Terror Screen;')
	send_command('alias reme input /item "Remedy" <me>; input /echo  REMEDY;')

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Merit', 'NOMB')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "Drain" <t>')
	send_command('bind !F2 input /ma "Aspir" <t>')
	send_command('bind !F3 input /ma "Aspir II" <t>')
	send_command('bind !F4 input /ma "Break" <t>')
	send_command('bind !F5 input /ma "Bind" <t>')
	send_command('bind !F6 input /ma "Gravity" <t>')
	send_command('bind !F7 input /ma "Stun" <t>')
	send_command('bind !F8 input /ma "Sleep" <t>')
	send_command('bind !F9 input /ma "Sleep II" <t>')
	send_command('bind !F10 input /ja "Manifestation" <me>; /echo --AOE Dark--')
	send_command('bind !F11 gs c cycle CastingMode')
	send_command('bind !F12 gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input /ma "Frazzle" <t>')
	send_command('bind ^F8 input /ma "Distract" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input ')
	send_command('bind ^F11 input ')
	send_command('bind ^F12 input /ja "Accession" <me>')

	
-- Debuffs ALT	
	send_command('bind !1 input /ma "Paralyna" <t>')
	send_command('bind !2 input /ma "Silena" <t>')
	send_command('bind !3 input /ma "Blindna" <t>')
	send_command('bind !4 input /ma "Cursna" <t>')
	send_command('bind !5 input /ma "Stona" <t>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Adloquium" <t>')
	send_command('bind !9 input /ma "Regen V" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input //exec sch/water.txt')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Cure" <t>')
	send_command('bind ^2 input /ma "Cure II" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "Haste" <t>')
	send_command('bind ^6 input /ma "Haste" <t>')
	send_command('bind ^7 input /ma "Haste" <t>')
	send_command('bind ^8 input /ma "Regen V" <t>')
	send_command('bind ^9 input //exec sch/frag.txt')
	send_command('bind ^0 input //exec sch/dist.txt')
	send_command('bind ^- input //exec sch/fus.txt')
	send_command('bind ^= input /ja "Alacrity" <me>')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
		ammo="Sapience Orb",
		head= gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		waist="Ninurta's Sash",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		back=gear.LughsCape_FC,
		legs="Psycloth lappas",
		feet=gear.merlinicCrackows_FC
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		ear2="Mendicant's earring"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		ear2="Mendicant's earring"
	})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, { 
		ear2="Barkaro. Earring"
	})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Immanence'] = {hands="Arbatel bracers +1"}
	sets.precast.JA['Perpetuance'] = {hands="Arbatel bracers +1"}
	sets.precast.JA['Tabula Rasa'] = {legs="Argute Pants +2"}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
	
	--Default WS MND
    sets.precast.WS = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Inyanga Dastanas +2",
		ring1="Aquasoul Ring",
		ring2="Spiral ring",
        back=gear.LughsCape_Magic,
		waist="Pythia Sash +1",
		legs="Vanya slops",
		feet="Inyanga crackows +2"
	}
	
	--WS, MAB Based
    sets.precast.WS['Flash Nova'] = {
        head="Vanya hood",
		neck="Eddy Necklace",
		ear1="Novio Earring",
		ear2="Hecate earring",
        body="Vanya Robe",
		hands="Inyanga Dastanas +2",
		ring1="Prolix ring",
		ring2="Acumen ring",
        back=gear.LughsCape_Magic,
		waist="Maniacus sash",
		legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +1s"
	}
	
	-- WS With Gorget/Mnd	
	sets.precast.WS['Realmrazer'] = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Inyanga Dastanas +2",
		ring1="Tamas ring",
		ring2="Aquasoul ring",
        back=gear.LughsCape_Magic,
		waist="Fotia Belt",
		legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +2"
	}
	
	--Gorget	
	
	sets.precast.WS['Myrkr'] = {
		ammo="Hydrocera",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Mendicant's Earring",
		ear2="Etiolation earring",
		body="Vanya Robe",
		hands="Kaykaus cuffs",
		ring1="Prolix Ring",
		ring2="Lebeche Ring",
		back="Oretania's cape +1",
		waist="Luminary Sash",
		legs="Psycloth Lappas",
		feet="Kaykaus boots"
	}
		
    
    -- Cure sets

    sets.midcast.Cure = {
		main={name="Ames",priority=16},
		sub={name="Genmei Shield", priority=15},
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		body="Kaykaus Bliaut",
		hands="Kaykaus cuffs",
		ring1="Kuchekula Ring",
		ring2="Sirona's Ring",
        back="Solemnity cape",
		waist=gear.ElementalObi,
		legs="Vanya Slops",
		feet="Kaykaus Boots"
	}

    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.CureMelee = sets.midcast.Cure

	sets.midcast.conserve = {
		main={name="Grioavolr", priority=16},
		sub={name="Giuoco Grip",priority=15},
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        body="Chironic doublet",
        back="Solemnity cape",
		waist="Austerity Belt +1",
		legs="Vanya slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	sets.midcast.Recall = sets.midcast.conserve

    sets.midcast.Cursna = {
		main={name="Gada", priority=16},
		sub={name="Ammurapi Shield",priority=15},
        head="Kaykaus mitra",
		neck="Malison Medallion",
		ring1="Haoma's ring",
		ring2="Haoma's ring",
        back="Oretan. Cape +1",
		feet="Vanya clogs"
	}


    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
		main={name="Gada", priority=16},
		sub={name="Ammurapi Shield",priority=15},
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Calamitous earring",
		ear2="Andoaa Earring",
        body= gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
        back="Mending Cape",
		waist="Olympus Sash",
		legs=gear.telchineBraconi_Enhancing,
		feet="Kaykaus Boots"
	}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		ear1="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		main={name="Vadose Rod", priority=16},
		sub={name="Ammurapi Shield",priority=15},
		head="Chironic hat",
		legs="Shedir Seraweels"
	})
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Flurry = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	
	
	sets.midcast.Embrava = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.buff['Perpetuance'] = set_combine(sets.midcast['Enhancing Magic'], {
        hands="Arbatel bracers +1"
    })
	
	
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'],{
		main={name="Bolelabunga", priority=16},
		sub={name="Ammurapi Shield",priority=15},
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		back="Lugh's Cape",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Refresh = sets.midcast.Haste
	sets.midcast.Klimaform = sets.midcast.Haste
	sets.midcast.Adloquium = sets.midcast.Haste

	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
		})
		
    sets.midcast['Voidstorm II'] = sets.midcast.Storm
	sets.midcast['Aurorastorm II'] = sets.midcast.Storm
	sets.midcast['Sandstorm II'] = sets.midcast.Storm
	sets.midcast['Rainstorm II'] = sets.midcast.Storm
	sets.midcast['Windstorm II'] = sets.midcast.Storm
	sets.midcast['Firestorm II'] = sets.midcast.Storm
	sets.midcast['Hailstorm II'] = sets.midcast.Storm
	sets.midcast['Thunderstorm II'] = sets.midcast.Storm

    sets.midcast.Protect = {
		ring1="Sheltered Ring",
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	}

    sets.midcast.Shell = sets.midcast.Protect 
		
		
    sets.midcast['Divine Magic'] = {
		ammo="Hydrocera",
        head="Inyanga tiara +2",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back=gear.LughsCape_Magic,
		waist=gear.ElementalObi,
		legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +2"
	}
   
 	sets.midcast['Elemental Magic'] = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back=gear.LughsCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
 
	sets.midcast['Elemental Magic'].NOMB = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Saevus Pendant +1",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Strendu ring",
		ring2="Shiva Ring +1",
        back=gear.LughsCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}	
	
	sets.midcast['Elemental Magic'].Merit = {
		main={name="Grioavolr", priority=16},
		sub={name="Alber Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body="Seidr Cotehardie",
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back=gear.LughsCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

	sets.midcast['Elemental Magic'].Helix = set_combine(sets.midcast['Elemental Magic'], {
	waist="Refoccilation Stone"
	})
	
	sets.midcast['Elemental Magic'].Noctohelix = sets.midcast.Kaustra
	
	sets.midcast.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Kaustra = set_combine(sets.precast.FC['Elemental Magic'], {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
		head="Pixie Hairpin +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric Gages",
		ring1="Mujin Band",
		ring2="Archon Ring",
        back=gear.LughsCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	})

	sets.midcast['Elemental Magic'].Noctohelix = sets.midcast.Kaustra		
	
	sets.midcast.sleep = {
		main={name="Gada", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Kaykaus Cuffs",
		ring1="Vertigo Ring",
		ring2="Kishar Ring",
        back=gear.LughsCape_Magic,
		waist="Casso Sash",
		legs="Jhakri slops +2",
		feet="Uk'uxkaj boots"
	}	
		
    sets.midcast['Dark Magic'] = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Erra Pendant",
		ear1="Enchanter Earring +1",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands=gear.chironicGloves_Magic,
		ring1="Vertigo Ring",
		ring2="Evanescence ring",
        back=gear.LughsCape_Magic,
		waist="Luminary Sash",
		legs="Jhakri slops +2",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		head=gear.merlinicHood_Magic,
		neck="Erra Pendant", 
		ear1="Hirudinea earring", 
		ear2="Barkaro. Earring",
		ring2="Evanscence ring",
		waist="Fucho-no-Obi",
		feet=gear.merlinicCrackows_Magic
	})
	
	sets.midcast.Aspir = sets.midcast.Drain
	

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main={name="Gada", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ammo="Hydrocera",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Vertigo Ring",
		ring2="Kishar Ring",
        back=gear.LughsCape_Magic,
		waist="Luminary sash",
		legs="Jhakri slops +2",
		feet="Jhakri pigaches +2"
	}

    sets.midcast.IntEnfeebles = {
		main={name="Gada", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Vertigo Ring",
		ring2="Kishar Ring",
        back=gear.LughsCape_Magic,
		waist="Luminary sash",
		legs="Jhakri slops +2",
		feet="Jhakri pigaches +2"
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --[[sets.resting = {
        head="Orvail Corona +1",
		neck="Eidolon Pendant +1",
		ear1="Moonshade Earring",
		ear2="Relaxing Earring",
        body="Oracle's robe",
		hands="Nares Cuffs",
        back="Vita Cape",
		legs="Menhit slacks",
		feet="Chelona Boots"
	}   ]]--
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation earring",
        body="Jhakri Robe +2",
		hands=gear.chironicGloves_Ref,
		ring1="Dark RIng",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet=gear.chironicSlippers_Ref
	}
	
    sets.idle.Refresh = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation earring",
        body="Jhakri Robe +2",
		hands=gear.chironicGloves_Ref,
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Fucho-no-Obi",
		legs="Assiduity pants +1",
		feet="Mallquis clogs +2"
	}	
		
    sets.idle.PDT = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Odnowa earring +1",
		ear2="Etiolation earring",
        body="Vrikopdara jupon",
		hands=gear.chironicGloves_Ref,
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Mallquis clogs +1"
	}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Blistering Sallet +1",
		neck="Lissome necklace",
		ear1="Brutal Earring",
		ear2="Zennaroi earring",
        body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Petrov Ring",
		ring2="Cacoethic ring +1",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Jhakri's slops +2",
		feet="Jhakri's pigaches +2"
	}
	
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {}--{head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel bracers +1", back="Lugh's Cape"}
    sets.buff['Penury'] = {}
    sets.buff['Parsimony'] = {}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = sets.buff['Celerity']

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

    sets.buff.FullSublimation = {body="Pedagogy Gown +1"}
    sets.buff.PDTSublimation = {body="Pedagogy Gown +1"}
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change. Turn this one to Meele.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Pythia Sash +1"
		if spell.element == world.weather_element or
		spell.element == world.day_element then 
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
		gear.default.obi_waist = "Refoccilation Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
		if state.CastingMode.value == 'Proc' then
			classes.CustomClass = 'Proc'
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if buffactive['Perpetuance'] then
    equip(sets.buff['Perpetuance'])
    end
end



function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

