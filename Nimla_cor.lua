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
    include('Nimla-Include.lua')
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 11; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 11; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 11; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 11; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	
	send_command('alias cha input /console gs c cycle LullabyChat')
	send_command('alias song1 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song2 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song3 input /ma "mage\'s ballad III" <me>; wait 6; input /ma "mage\'s ballad II" <me>; wait 6; input /ma "mage\'s ballad" <me>; wait 6; input /ma "victory march" <me>;')
	send_command('alias song4 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song5 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song6 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "hunter\'s prelude" <me>;')
	send_command('alias song7 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "hunter\'s prelude" <me>;')
	send_command('alias song8 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "sword madrigal" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song9 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "sword madrigal" <me>; wait 6; input /ma "blade madrigal" <me>;')	
	send_command('alias song10 input /ma "victory march" <me>; wait 6; input /ma "advancing march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "mage\'s ballad III" <me>; wait 6; input /ma "mage\'s ballad II" <me>;')
	send_command('alias song11 input /ma "victory march" <me>; wait 6; input /ma "advancing march" <me>; wait 6; input /ma "mage\'s ballad III" <me>; wait 6; input /ma "mage\'s ballad II" <me>;')	
	send_command('alias song12 input /ma "blade madrigal" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "earth carol" <me>; wait 6; input /ma "earth carol II" <me>;')
	send_command('alias song13 input /ma "blade madrigal" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "earth carol" <me>; wait 6; input /ma "earth carol II" <me>;')	
	send_command('alias song14 input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "Dextrous Etude" <me>; wait 6; input /ma "Uncanny Etude" <me>;')
	send_command('alias song15 input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>; wait 6; input /ma "Dextrous Etude" <me>; wait 6; input /ma "Uncanny Etude" <me>;')	
	send_command('alias song16 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "mage\'s ballad III" <me>;')
	send_command('alias song17 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "mage\'s ballad III" <me>;')	
	send_command('alias song18 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song19 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song20 input /ma "fire carol II" <me>; wait 6; input /ma "earth carol II" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "ice carol II" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song21 input /ma "fire carol II" <me>; wait 6; input /ma "earth carol II" <me>; wait 6; input /ma "ice carol II" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song22 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song23 input /ma "Honor March" <me>; wait 6; input /ma "archer\'s prelude" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "valor minuet IV" <me>;')
	send_command('alias song24 input /ma "Honor March" <me>; wait 6; input /ma "blade madrigal" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song25 input /ma "Honor March" <me>; wait 6; input /ma "blade madrigal" <me>; wait 6; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song26 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song27 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song28 input /ma "Honor March" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song29 input /ma "Honor March" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "lightning carol" <me>; wait 6; input /ma "lightning carol II" <me>;')
	send_command('alias song30 input /ma "victory march" <me>; wait 6; input /ma "mage\'s ballad III" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "Sage Etude" <me>; wait 6; input /ma "Learned Etude" <me>;')
	send_command('alias song31 input /ma "victory march" <me>; wait 6; input /ma "mage\'s ballad III" <me>; wait 6; input /ma "Sage Etude" <me>; wait 6; input /ma "Learned Etude" <me>;')
	send_command('alias song32 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "sword madrigal" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song33 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "sword madrigal" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song34 input /ma "fire carol II" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "ice carol II" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song35 input /ma "fire carol II" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "ice carol II" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song36 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "valor minuet V" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>;')
	send_command('alias song37 input /ma "Honor March" <me>; wait 6; input /ma "victory march" <me>; wait 6; input /ma "valor minuet V" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>;')
	send_command('alias song38 input /ma "wind carol II" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "Army\'s paeon" <me>; wait 5; input /ma "Army\'s paeon II" <me>; wait 5; input /ma "wind carol" <me>; wait 6; input /ma "blade madrigal" <me>;')
	send_command('alias song39 input /ma "wind carol II" <me>; wait 6; input /ma "Sentinel\'s Scherzo" <me>; wait 6; input /ma "wind carol" <me>; wait 6; input /ma "blade madrigal" <me>;')

	
	send_command('alias int1 input /ma "Learned Etude" <me>; ')
	send_command('alias int2 input /ma "Sage Etude" <me>; ')
	send_command('alias agi1 input /ma "Quick Etude" <me>; ')
	send_command('alias agi2 input /ma "Swift Etude" <me>; ')
	send_command('alias dex1 input /ma "Dextrous Etude" <me>; ')
	send_command('alias dex2 input /ma "Uncanny Etude" <me>; ')
	
	send_command('alias god input /ma "Goddess\'s Hymnus" <t>; ')
	
	send_command('alias wing1 input /item "lucid wings I" <me>; ')
	send_command('alias wing2 input /item "lucid wings II" <me>; ')
	
	send_command('alias ra1 input /ma "archer\'s prelude" <t>; ')
	send_command('alias ra2 input /ma "hunter\'s prelude" <t>; ')
	
	send_command('alias fc1 input /ma "fire carol" <me>; ')
	send_command('alias fc2 input /ma "fire carol II" <me>; ')
	send_command('alias ic1 input /ma "ice carol" <me>; ')
	send_command('alias ic2 input /ma "ice carol II" <me>; ')
	send_command('alias wc1 input /ma "wind carol" <me>; ')
	send_command('alias wc2 input /ma "wind carol II" <me>; ')
	send_command('alias ec1 input /ma "earth carol" <me>; ')
	send_command('alias ec2 input /ma "earth carol II" <me>; ')
	send_command('alias lc1 input /ma "lightning carol" <me>; ')
	send_command('alias lc2 input /ma "lightning carol II" <me>; ')
	send_command('alias llc1 input /ma "light carol" <me>; ')
	send_command('alias llc2 input /ma "light carol II" <me>; ')
	send_command('alias dc1 input /ma "dark carol" <me>; ')
	send_command('alias dc2 input /ma "dark carol II" <me>; ')
	send_command('alias sche input /ma "Sentinel\'s Scherzo" <t>; ')
	send_command('alias hm input /ma "Honor March" <t>; ')
	
	send_command('alias pae1 input /ma "Army\'s paeon" <t>; ')
	send_command('alias pae2 input /ma "Army\'s paeon II" <t>; ')
	send_command('alias pae3 input /ma "Army\'s paeon III" <t>; ')
	send_command('alias pae4 input /ma "Army\'s paeon IV" <t>; ')
	send_command('alias pae5 input /ma "Army\'s paeon V" <t>; ')
	send_command('alias pae6 input /ma "Army\'s paeon VI" <t>; ')
	send_command('alias pae7 input /ma "Army\'s paeon VII" <t>; ')
	
	send_command('alias min5 input /ma valor minuet V" <t>; ')
	send_command('alias min4 input /ma "valor minuet IV" <t>; ')
	send_command('alias min3 input /ma "valor minuet III" <t>; ')
	send_command('alias min2 input /ma "valor minuet II" <t>; ')
	send_command('alias min1 input /ma "valor minuet" <t>; ')
	
	send_command('alias minn5 input /ma "Knight\'s Minne V" <t>; ')
	send_command('alias minn4 input /ma "Knight\'s Minne IV" <t>; ')
	send_command('alias minn3 input /ma "Knight\'s Minne III" <t>; ')
	send_command('alias minn2 input /ma "Knight\'s Minne II" <t>; ')
	send_command('alias minn1 input /ma "Knight\'s Minne" <t>; ')
	
	send_command('alias seal input /ja "Elemental Seal" <me>; ')
	send_command('alias fis input /equip range "halcyon rod";input /equip ammo "Robber Rig";input /equip head "Midras\'s helm +1"; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>')
	send_command('alias revit input /item "Super Revitalizer" <me>')
	
	state.Buff.Barrage = buffactive.Barrage or false
--state.Buff.Camouflage = buffactive.Camouflage or false
end

	
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Ranged','Melee')
	state.RangedMode:options('Normal', 'Acc')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	state.WeaponskillMode:options('Normal','Acc')

	send_command('bind @F1 input /ma "Fire Threnody II" <t>')
	send_command('bind @F2 input /ma ""Ice Threnody II" <t>')
	send_command('bind @F3 input /ma "Wind Threnody II" <t>')
	send_command('bind @F4 input /ma "Earth Threnody II" <t>')
	send_command('bind @F5 input /ma "Lightning Threnody II" <t>')
	send_command('bind @F6 input /ma "Water Threnody II" <t>')
	send_command('bind @F7 input /ma "Light Threnody II" <t>')
	send_command('bind @F8 input /ma "Dark Threnody II" <t>')
	send_command('bind @F9 input /ma "pining Nocturne" <t>')
	send_command('bind @F10 input /ma "Sentinel\'s Scherzo" <t>')
	send_command('bind @F11 input /ma "hunter\'s prelude" <t>')
	send_command('bind @F12 input /ma "archer\'s prelude" <t>')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "slow" <t>')
	send_command('bind !F2 input /ma "paralyze" <t>')
	send_command('bind !F3 input /ma "silence" <t>')
	send_command('bind !F4 input /ma "foe requiem VII" <t>')
	send_command('bind !F5 input /ma "Stoneskin" <me>')
	send_command('bind !F6 input /ma "sentinel\'s scherzo" <t>')
	send_command('bind !F7 input /ma "valor minuet II" <t>')
	send_command('bind !F8 input /ma "valor minuet V" <t>')
	send_command('bind !F9 input /ma "dextrous etude" <t>')
	send_command('bind !F10 input /ma "blink" <me>')
	send_command('bind !F11 input /ja "pianissimo" <me>')
	send_command('bind !F12 input /ja "troubadour" <me>')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "poisona" <t>')
	send_command('bind ^F2 input /ma "blindna" <t>')
	send_command('bind ^F3 input /ma "silena" <t>')
	send_command('bind ^F4 input /ma "stona" <t>')
	send_command('bind ^F5 input /ma "viruna" <t>')
	send_command('bind ^F6 input /ma "cursna" <t>')
	send_command('bind ^F7 input /ma "valor minuet III" <t>')
	send_command('bind ^F8 input /ma "valor minuet IV" <t>')
	send_command('bind ^F9 input /ma "sinewy etude" <t>')
	send_command('bind ^F10 input /ma "stoneskin" <me>')
	send_command('bind ^F11 input /ma "haste" <t>')
	send_command('bind ^F12 input /ja "nightingale" <me>')

	send_command('bind @1 input /ma "cure III" <t>')
	send_command('bind @2 input /ma "cure IV" <t>')
	send_command('bind @3 input /ma "mage\'s ballad" <t>')
	send_command('bind @4 input /ma "fire carol II" <t>')
	send_command('bind @5 input /ma "ice carol II" <t>')
	send_command('bind @6 input /ma "wind carol II" <t>')
	send_command('bind @7 input /ma "earth carol II" <t>')
	send_command('bind @8 input /ma "lightning carol II" <me>')
	send_command('bind @9 input /ma "water carol II" <t>')
	send_command('bind @0 input /ma "light carol II" <t>')
	send_command('bind @- input /ma "dark carol II" <t>')
	send_command('bind @= input /ma "Curaga II" <t>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ja "Crooked Cards" <me>')
	send_command('bind !2 input /ja "Double-Up" <me>')
	send_command('bind !3 input /ja "Snake Eye" <me> ')
	send_command('bind !4 input /ma "mage\'s ballad III" <t>')
	send_command('bind !5 input /ma "Curaga II" <t>')
	send_command('bind !6 input /ma "victory march" <t>')
	send_command('bind !7 input /ma "blade madrigal" <t>')
	send_command('bind !8 input /ma "foe lullaby II" <t>')
	send_command('bind !9 input /ma "invisible" <t>')
	send_command('bind !0 input /ja "divine seal" <t>')
	send_command('bind !- input /ja "marcato" <me>')
	send_command('bind != input /ja "tenuto" <t>')

-- Misc CTRL	
	send_command('bind ^1 input /ra <t>')
	send_command('bind ^2 input /ja "Samurai Roll" <me>')
	send_command('bind ^3 input /ja "Chaos Roll" <me>')
	send_command('bind ^4 input /ma "mage\'s ballad II" <t>')
	send_command('bind ^5 input /ma "Chocobo mazurka" <t>')
	send_command('bind ^6 input /ma "advancing march" <t>')
	send_command('bind ^7 input /ma "sword madrigal" <t>')
	send_command('bind ^8 input /ma "horde lullaby II" <t>')
	send_command('bind ^9 input /ma "sneak" <t>')
	send_command('bind ^0 input /ma "carnage elegy" <t>')
	send_command('bind ^- input /ja "soul voice" <me>')
	send_command('bind ^= input /ja "clarion call" <me>')
    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()



	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
	sets.precast.FC = {head="Carmine mask", neck="Baetyl pendant",body="Samnuha coat",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Rawhide trousers"}
	
	-- Ranged sets (snapshot)
	
	sets.precast.CorsairRoll = {head="Lanun Tricorne", body="Lanun frac",hands="Chasseur's Gants +1",neck="Regal Necklace",
    left_ring="Luzaf's ring", legs="Desultor tassets", back="Camulus's Mantle"
	}
	
	sets.precast.RA = {
		head="Amini gapette",
		body="Skopos jerkin",hands="Alruna's gloves +1", 
		back="Camulus's mantle",waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.precast.JA['Random Deal'] = {body="Lanun frac"}
	
	    
	sets.precast.WS['Last Stand'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Enervating earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Mummu ring",ring2="Ilabrat ring",
        back="Camulus's mantle",waist="Fotia Belt",legs="Meghanada chausses +2",feet="Meghanada jambeaux +2"}

	sets.precast.WS['Wildfire'] = {head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Crit. hit damage +3%','"Mag.Atk.Bns."+10',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+16','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Hecate's Earring",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10',}},}
		
	sets.precast.WS['Leaden Salute'] = {head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Crit. hit damage +3%','"Mag.Atk.Bns."+10',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+16','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Hecate's Earring",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10',}},}
		
	sets.precast.WS['Savage Blade'] = {range={ name="Compensator", augments={'DMG:+15','Rng.Acc.+15','Rng.Atk.+15',}},
    head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Weapon skill damage +3%','AGI+5','Rng.Acc.+4','Rng.Atk.+4',}},
    neck="Ire Torque +1",
    waist="Metalsinger Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Regal Ring",
    right_ring="Rufescent Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},}
		
	----Weaponskill Sets with Acc----
																							

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Meghanada visor +1",neck="Iskur gorget",ear1="Neritic earring",ear2="Enervating earring",
		body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Mummu ring",ring2="Ilabrat ring",
		back="Camulus's mantle",waist="Eschan stone",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Orion beret +3",neck="Combatant's torque",ring1="Regal ring", ring2="Hajduk ring +1",
		hands="Meghanada gloves +2",back=gear.belenusCape_STP})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})   
      
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +1",neck="Twilight torque",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet="Meghanada jambeaux +2"}


    sets.Kiting = {feet="Jute boots +1"}


	sets.engaged.Ranged = {head="Meghanada visor +1",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet="Meghanada jambeaux +2"}

    sets.engaged.Melee = {head="Mummu bonnet +1",neck="Lissome necklace",ear1="Steelflash earring",ear2="Bladeborn earring",	
        body="Mummu jacket +2",hands="Mummu wrists +1",ring1="Regal ring",ring2="Epona's ring",
        back="Letalis mantle",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
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


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end


function job_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
equip(sets.buff.Barrage)
eventArgs.handled = true
end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end
