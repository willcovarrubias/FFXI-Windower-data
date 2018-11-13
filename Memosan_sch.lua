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

include('Memosan-Include.lua')

	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	
	send_command('alias fs2 input /ma "firestorm2" <t>')
	send_command('alias ss2 input /ma "sandstorm2" <t>')
	send_command('alias rs2 input /ma "rainstorm2" <t>')
	send_command('alias ts2 input /ma "thunderstorm2" <t>')
	send_command('alias ws2 input /ma "windstorm2" <t>')
	send_command('alias hs2 input /ma "hailstorm2" <t>')
	send_command('alias vs2 input /ma "voidstorm2" <t>')
	send_command('alias as2 input /ma "aurorastorm2" <t>')
	
	send_command('alias gem input /ja "Immanence" <me>')
	
	send_command('alias p5 input /ma "Protect V" <t>')
	send_command('alias s5 input /ma "shell V" <t>')
	
	send_command('alias adl input /ma "adloquium" <t>')
	send_command('alias aqu input /ma "aquaveil" <me>')
	send_command('alias fis input /equip range "halcyon rod";input /equip ammo "Robber Rig";input /equip head "Midras\'s helm +1"; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias grav input //exec sch/gravitation.txt')
	send_command('alias dist input //exec sch/distortion.txt')
	send_command('alias fire input //exec sch/fire.txt')
	send_command('alias ice input //exec sch/ice.txt')
	send_command('alias thun input //exec sch/thun.txt')
	send_command('alias wat input //exec sch/water.txt')
	send_command('alias light input //exec sch/light.txt')
	send_command('alias dark input //exec sch/dark.txt')
	send_command('alias wind input //exec sch/wind.txt')
	send_command('alias stone input //exec sch/stone.txt')
	send_command('alias rem input /item "Remedy" <me>')
	send_command('alias revit input /item "Super Revitalizer" <me>')
	send_command('alias doom input /item "Savior\'s tonic" <me>')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Acc', 'PDT')
    state.CastingMode:options('Normal', 'MB', 'NormalMerit', 'MBMerit')
	state.IdleMode:options('Idle', 'Refresh')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	
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
	send_command('bind !F11 input /ja "" <me>; /echo --Fast Casting--')
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
	send_command('bind ^F10 input /ja "Perpetuance" <me>')
	send_command('bind ^F11 input /ja "enlightenment" <me>')
	send_command('bind ^F12 input /ja "tabula rasa" <me>')
	
	send_command('bind @F1 input /ma "poisona" <t>')
	send_command('bind @F2 input /ma "blindna" <t>')
	send_command('bind @F3 input /ma "silena" <t>')
	send_command('bind @F4 input /ma "stona" <t>')
	send_command('bind @F5 input /ma "viruna" <t>')
	send_command('bind @F6 input /ma "cursna" <t>')
	send_command('bind @F7 input /ma "Cure" <t>')
	send_command('bind @F8 input /ma "Cure II" <t>')
	send_command('bind @F9 input /ma "Cure IV" <t>')
	send_command('bind @F10 input /item "Echo Drops" <me>')
	send_command('bind @F11 input /ma "sneak" <t>')
	send_command('bind @F12 input /ma "invisible" <t>')


-- Debuffs ALT	
	send_command('bind !1 input /ja "alacrity" <me>')
	send_command('bind !2 input /ma "regen V" <t>')
	send_command('bind !3 input /ma "Cure III" <t>')
	send_command('bind !4 input /ma "Cure IV" <t>')
	send_command('bind !5 input /ma "Haste" <t>')
	send_command('bind !6 input /ja "accession" <me>')
	send_command('bind !7 input /ma "erase" <t>')
	send_command('bind !8 input /ma "stun" <t>')
	send_command('bind !9 input /ma "Water" <t>')
	send_command('bind !0 input /ma "Fire" <t>')
	send_command('bind !- input /ma "Blizzard" <t>')
	send_command('bind != input /ma "Thunder" <t>')

	
-- Debuffs ALT	
	send_command('bind @1 input /ma "Poisona" <t>')
	send_command('bind @2 input /ma "Silena" <t>')
	send_command('bind @3 input /ma "Blindna" <t>')
	send_command('bind @4 input /ma "Cursna" <t>')
	send_command('bind @5 input /ma "Stona" <t>')
	send_command('bind @6 input /ma "Poisona" <t>')
	send_command('bind @7 input /ma "Viruna" <t>')
	send_command('bind @8 input /ma "Adloquium" <t>')
	send_command('bind @9 input /ma "Regen V" <t>')
	send_command('bind @0 input /ma "Erase" <t>')
	send_command('bind @- input /ja "Sublimation" <me>')
	send_command('bind @= input //exec sch/ice.txt')

-- Misc CTRL	
	send_command('bind ^1 input /ja "light arts" <me>')
	send_command('bind ^2 input /ja "Dark arts" <me>')
	send_command('bind ^3 input /ja "Convert" <me>')
	send_command('bind ^4 input /ja "Sublimation" <me>')
	send_command('bind ^5 input /ma "paralyna" <t>')
	send_command('bind ^6 input /ja "Addendum: White" <me>')
	send_command('bind ^7 input /ja "Addendum: Black" <me>')
	send_command('bind ^8 input //exec sch/fragmentation.txt')
	send_command('bind ^9 input //exec sch/gravitation.txt')
	send_command('bind ^0 input //exec sch/distortion.txt')
	send_command('bind ^- input //exec sch/fusion.txt')
	send_command('bind ^= input //exec sch/dark.txt')
	
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="", head=gear.merlinicHood_FC, hands=gear.merlinicDastanas_FC,neck="Voltsurge torque", ear1="",ear2="Loquacious earring", 
	body=gear.merlinicJubbah_FC,back="",ring1="", ring2="",legs="Psycloth lappas", feet=gear.merlinicCrackows_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {back=""})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight cloak", head=empty})
	
	
    -- Precast sets to enhance JAs
    
    -- Weaponskill sets
		
    sets.precast.WS['Myrkr'] = {}
		
		
		
    -- Midcast Sets // ('Normal', 'MB', 'NormalMerit', 'MBMerit')
	
	sets.midcast['Elemental Magic'] = {main="Grioavolr",ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Shiva Ring +1",ring2="Strendu ring",
        back="Taranus's cape",waist=gear.ElementalObi,legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Mizukage-no-Kubikazari",body=gear.merlinicJubbah_MBB,hands="Amalric gages", 
	legs=gear.merlinicShalwar_MBB, ring1="Mujin band", feet=gear.merlinicCrackows_MBB})

	sets.midcast['Elemental Magic'].NormalMerit = set_combine(sets.midcast['Elemental Magic'], {body="Seidr cotehardie"})
	
	sets.midcast['Elemental Magic'].MBMerit = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Mizukage-no-Kubikazari",body="Seidr cotehardie", 
	hands="Amalric gages", ring1="Mujin band", legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB})
	
    	
	sets.midcast.Comet = set_combine(sets.midcast['Elemental Magic'], {head="Pixie Hairpin +1", ring2="Archon Ring"})
	sets.midcast.Comet.MB = set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1", ring2="Archon Ring"})
		
	sets.midcast.Meteor = set_combine(sets.midcast['Elemental Magic'], {})
	
	sets.midcast.Death = set_combine(sets.midcast['Elemental Magic'], {head="Pixie Hairpin +1",ring2="Archon Ring"})
	sets.midcast.Death.MB = set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1",ring2="Archon Ring"})
	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	
	--sets.midcast.FastRecast = {
	--	head="Blistering sallet +1",neck="Incanter's torque", body="Jhakri robe +2", hands="Jhakri cuffs +2", ring2="Strendu ring",
	--	waist="Goading belt",legs="Assiduity pants +1",feet=gear.merlinicCrackows_FC}
		
	--sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	--legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"})
	
	sets.midcast['Enhancing Magic'] = {ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"}
	
	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Incanter's torque",ear1="Enchanter earring +1",ear2="Barkarole earring",
        body=gear.merlinicJubbah_FC,hands="Jhakri cuffs +2",ring1="Etana ring",ring2="Kishar ring",
        back="Taranus's cape",waist="Luminary sash",legs=gear.merlinicShalwar_MBB,feet="Jhakri pigaches +2"}
   
	sets.midcast['Healing Magic'] = set_combine(sets.midcast.FastRecast, {main="", neck="",body="",
		back="Solemnity cape", legs="Chironic hose", feet="Vanya clogs"})

	sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast, {main="Grioavolr",head="Appetence crown", neck="Erra pendant",ring1="Excelsis ring", ear2="Hirudinea earring", ring2="Evanescence ring", legs="Jhakri slops +2", feet=gear.merlinicCrackows_MBB})



	    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {main="Akademos", ammo="",
        head="",neck="Loricate torque",ear1="",ear2="",
        body="Jhakri robe +2",hands="",ring1="Globidonta ring",ring2="Sheltered Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="",feet=""}

	sets.idle.Refresh = {main="Akademos",ammo="Staunch tathlum",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Mallquis clogs +2"}    
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Crier's gaiters"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged.Acc = {}

	sets.engaged.STP = {}

	sets.engaged.PDT = {}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Yamabuki-no-obi"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Rairin obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Salire Belt"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hyorin obi"
		end
	end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
--function job_precast(spell, action, spellMap, eventArgs)
--    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
--        eventArgs.handled = true
--   end
    
--    if spell.skill == 'Healing Magic' then
--       gear.default.obi_back = "Mending Cape"
--    else
--        gear.default.obi_back = "Toro Cape"
--    end
--end


--function job_post_midcast(spell, action, spellMap, eventArgs)
--    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
--    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
--        equip(sets.buff['Divine Caress'])
--    end
--end

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
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 10)
end
