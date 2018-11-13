-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}

    state.LullabyChat = M{['description']='Calling Lullabies', 'echo', 'party'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false

	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias int1 input /ma "Learned Etude" <me>; ')
	send_command('alias int2 input /ma "Sage Etude" <me>; ')
	send_command('alias agi1 input /ma "Quick Etude" <me>; ')
	send_command('alias agi2 input /ma "Swift Etude" <me>; ')
	
	send_command('alias seal input /ja "Elemental Seal" <me>; ')
	send_command('alias fis input /equip range "halcyon rod";input /equip ammo "Robber Rig";input /equip head "Midras\'s helm +1"; ')
	send_command('alias echo input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>')
	
	
    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
    --send_command('exec exemelbrdbind.txt')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'NoAftercast')

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

	send_command('bind @1 input /equip range "gjallarhorn"')
	send_command('bind @2 input /equip range "Daurdabla"')
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
	send_command('bind !1 input /ma "paralyna" <t>')
	send_command('bind !2 input /ma "Cure IV" <t>')
	send_command('bind !3 input /ma "erase" <t>')
	send_command('bind !4 input /ma "mage\'s ballad III" <t>')
	send_command('bind !5 input /ma "Curaga" <t>')
	send_command('bind !6 input /ma "victory march" <t>')
	send_command('bind !7 input /ma "blade madrigal" <t>')
	send_command('bind !8 input /ma "foe lullaby II" <t>')
	send_command('bind !9 input /ma "invisible" <t>')
	send_command('bind !0 input /ja "divine seal" <t>')
	send_command('bind !- input /ja "marcato" <me>')
	send_command('bind != input /ja "tenuto" <t>')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Curaga" <t>')
	send_command('bind ^2 input /ma "Cure III" <t>')
	send_command('bind ^3 input /ma "magic finale" <t>')
	send_command('bind ^4 input /ma "mage\'s ballad II" <t>')
	send_command('bind ^5 input /ma "Chocobo mazurka" <t>')
	send_command('bind ^6 input /ma "advancing march" <t>')
	send_command('bind ^7 input /ma "sword madrigal" <t>')
	send_command('bind ^8 input /ma "horde lullaby II" <t>')
	send_command('bind ^9 input /ma "sneak" <t>')
	send_command('bind ^0 input /ma "carnage elegy" <t>')
	send_command('bind ^- input /ja "soul voice" <me>')
	send_command('bind ^= input /ja "clarion call" <me>')
	
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds

    --include("Exemel-Include.lua")
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="Kali",
        neck="Voltsurge Torque",
        body="Inyanga Jubbah +1",hands="Leyline Gloves",
        back=gear.Intarabus_FC}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {head="Fili Calot +1",feet="Bihu Slippers +1"})

    sets.precast.FC.BardSong['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
        
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +1"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS)

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = sets.precast.FC
        
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used. //Or, my Gjallarhorn is bad and I feel bad.

    sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
    sets.midcast.Lullaby = {range="Daurdabla",hands="Brioso Cuffs +1"}
    sets.midcast['Foe Lullaby'] = {range="Marsyas",hands="Brioso Cuffs +1"}
    sets.midcast['Foe Lullaby II'] = {range="Marsyas",hands="Brioso Cuffs +1"}
    sets.midcast.Madrigal = {head="Fili Calot +1",back=gear.Intarabus_FC}
    sets.midcast.Prelude = {back=gear.Intarabus_FC}
    sets.midcast.March = {hands="Fili Manchettes +1"}
    sets.midcast["Honor March"] = {range="Marsyas",hands="Fili Manchettes +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +1"}
    sets.midcast.Minne = {}
    sets.midcast.Carol = {}
    sets.midcast.Etude = {}
    sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
    sets.midcast["Magic Finale"] = {legs="Fili Rhingrave +1"}
    sets.midcast["Goddess's Hymnus"] = set_combine(sets.precast.FC.BardSong, {range="Daurdabla"})
    sets.midcast.Paeon = set_combine(sets.precast.FC.BardSong, {range="Daurdabla"})

    sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
    

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {main="Kali",sub="Genmei Shield",
        head="Fili Calot +1",neck="Moonbow Whistle",
        body="Fili Hongreline +1",hands="Fili Manchettes +1",
        back=gear.Intarabus_FC,legs="Inyanga Shalwar +1",feet="Brioso Slippers +1"}

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {main="Kali",sub="Genmei Shield",
        head="Fili Calot +1",neck="Moonbow Whistle",
        body="Fili Hongreline +1",hands="Fili Manchettes +1",
        back=gear.Intarabus_FC,waist="Pya'ekue belt",legs="Inyanga Shalwar +1",feet="Brioso Slippers +1"}

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {legs="Fili Rhingrave +1"}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {main="Mafic Cudgel",range=info.ExtraSongInstrument,
        head="Blistering Sallet +1",neck="Incanter's Torque",
        body="Onca Suit",hands="",
        back="Solemnity Cape",waist="Pya'ekue belt",legs="",feet=""}

    -- Other general spells and classes.
    sets.midcast.Cure = {main={name="Serenity",priority=16},sub={name="Niobid Strap",priority=1},
        neck="Incanter's Torque",
        body="Heka's Kalasiris",hands="Telchine Gloves",
        waist="Hachirin-no-obi",legs="Nares Trews"}
        
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head=gear.telchineCap_Enhancing,neck="Incanter's Torque",
        body=gear.telchineChasuble_Enhancing,
        legs=gear.telchineBraconi_Enhancing}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",waist="Siegel Sash"})

    sets.midcast['Dia II'] = {head="Chironic Hat", body="Chironic Doublet", waist="Chaac Belt"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Mafic Cudgel",sub="Genmei Shield",
        head="Blistering Sallet +1",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Etiolation Earring",
        body="Vrikodara Jupon",hands="Ayanmo Manopolas +1",ring1="Vocane Ring",ring2="Defending Ring",
        back="Mecistopins Mantle",waist="Flume Belt +1",legs="Assiduity Pants +1",feet="Fili Cothurnes +1"}

    sets.idle.NoAftercast = {}
    
    
    -- Defense sets

    sets.Kiting = {feet="Fili Cothurnes +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Blistering Sallet +1",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Onca Suit",hands="",ring1="Hetairoi Ring",ring2="Rajas Ring",
        waist="Pya'ekue belt",legs="",feet=""}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and not state.Buff['Pianissimo'] then            
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        end
    end
    if buffactive.Nightingale or buffactive.Pianissimo then
        eventArgs.useMidcastGear = true
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            equip(sets.midcast.Daurdabla)
        end

        state.ExtraSongsMode:reset()
    end
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and not spell.interrupted then
        if spell.target and spell.target.type == 'SELF' then 
            adjust_timers(spell, spellMap)
        end
    end    
    if spellMap == "Lullaby" and not spell.interrupted then
        local duration = calculate_duration(spell.en, spellMap)
        dur_secs = duration % 60
        dur_mins = (duration - dur_secs)/60
        --print(dur_mins..":"..dur_secs.." "..duration)
        if dur_secs >= 10 then
            send_command("input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins..":"..dur_secs.."]")
        else
            send_command("input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins..":0"..dur_secs.."]")
        end
        for i = 0,dur_mins do
            send_command("wait "..dur_secs+60*i..";input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins-i..":00]")
            if i == dur_mins-1 then
                send_command("wait "..30+dur_secs+60*i..";input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins-1-i..":30]")
                send_command("wait "..45+dur_secs+60*i..";input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins-1-i..":15]")
                send_command("wait "..55+dur_secs+60*i..";input /"..state.LullabyChat.value.." "..spell.en.." ["..dur_mins-1-i..":05]")
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','ammo')
        else
            enable('main','sub','ammo')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        return 'DaurdablaDummy'
    else
        return 'SongEffect'
    end
end


-- Function to create custom buff-remaining timers with the Timers plugin,
-- keeping only the actual valid songs rather than spamming the default
-- buff remaining timers.
function adjust_timers(spell, spellMap)
    if state.UseCustomTimers.value == false then
        return
    end
    
    local current_time = os.time()
    
    -- custom_timers contains a table of song names, with the os time when they
    -- will expire.
    
    -- Eliminate songs that have already expired from our local list.
    local temp_timer_list = {}
    for song_name,expires in pairs(custom_timers) do
        if expires < current_time then
            temp_timer_list[song_name] = true
        end
    end
    for song_name,expires in pairs(temp_timer_list) do
        custom_timers[song_name] = nil
    end
    
    local dur = calculate_duration(spell.name, spellMap)
    if custom_timers[spell.name] then
        -- Songs always overwrite themselves now, unless the new song has
        -- less duration than the old one (ie: old one was NT version, new
        -- one has less duration than what's remaining).
        
        -- If new song will outlast the one in our list, replace it.
        if custom_timers[spell.name] < (current_time + dur) then
            send_command('timers delete "'..spell.name..'"')
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.name..'" '..dur..' down')
        end
    else
        -- Figure out how many songs we can maintain.
        local maxsongs = 2
        if player.equipment.range == info.ExtraSongInstrument then
            maxsongs = maxsongs + info.ExtraSongs
        end
        if buffactive['Clarion Call'] then
            maxsongs = maxsongs + 1
        end
        -- If we have more songs active than is currently apparent, we can still overwrite
        -- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
        if maxsongs < table.length(custom_timers) then
            maxsongs = table.length(custom_timers)
        end
        
        -- Create or update new song timers.
        if table.length(custom_timers) < maxsongs then
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.name..'" '..dur..' down')
        else
            local rep,repsong
            for song_name,expires in pairs(custom_timers) do
                if current_time + dur > expires then
                    if not rep or rep > expires then
                        rep = expires
                        repsong = song_name
                    end
                end
            end
            if repsong then
                custom_timers[repsong] = nil
                send_command('timers delete "'..repsong..'"')
                custom_timers[spell.name] = current_time + dur
                send_command('timers create "'..spell.name..'" '..dur..' down')
            end
        end
    end
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
    --player = windower.ffxi.get_player()

    local mult = 1

    if player.job_points.brd.jp_spent > 1200 then mult = mult + 0.05 end

    if player.equipment.range == "Daurdabla" then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end
    if player.equipment.range == "Marsyas" then mult = mult + 0.5 end
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.3 end
    if player.equipment.range == "Daurdabla" then mult = mult + 0.1 end
    if player.equipment.range == "Daurdabla +1" then mult = mult + 0.2 end

    if player.equipment.main == "Carnwenhan" then mult = mult + 0.5 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Kali" then mult = mult + 0.05 end
    if player.equipment.sub == "Kali" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.neck == "Brioso Whistle" then mult = mult + 0.1 end
    if player.equipment.neck == "Moonbow Whistle" then mult = mult + 0.2 end
    if player.equipment.neck == "Moonbow Whistle +1" then mult = mult + 0.3 end
    if player.equipment.body == "Fili Hongreline" then mult = mult + 0.11 end
    if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.12 end
    if player.equipment.legs == "Inyanga Shalwar" then mult = mult + 0.12 end
    if player.equipment.legs == "Inyanga Shalwar +1" then mult = mult + 0.15 end
    if player.equipment.legs == "Inyanga Shalwar +1" then mult = mult + 0.17 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
    if player.equipment.feet == "Brioso Slippers +2" then mult = mult + 0.13 end
    if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.15 end
    
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +2" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +3" then mult = mult + 0.2 end
    if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1 +1" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.back == "Intarabus's Cape" then mult = mult + 0.1 end
    if spellMap == 'Prelude' and player.equipment.back == "Intarabus's Cape" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == 'Fili Manchettes' then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == 'Fili Manchettes +1' then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1" then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1 +1" then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.range == "Daurdabla +1" then mult = mult + 0.2 end
    if spellMap == 'Lullaby' and player.equipment.hands == "Brioso Cuffs" then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == "Brioso Cuffs +1" then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == "Brioso Cuffs +2" then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == "Brioso Cuffs +3" then mult = mult + 0.2 end
    if spellMap == 'Lullaby' and player.equipment.range == "Daurdabla" then mult = mult + 0.2 end
    if spellMap == 'Lullaby' and player.equipment.range == "Daurdabla +1" then mult = mult + 0.2 end
    if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1" then mult = mult + 0.1 end
    if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1 +1" then mult = mult + 0.1 end
    
    if spellName == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end

    base = 120
    if spellName == "Foe Lullaby II" or spellName == "Horde Lullaby II" then 
        base = 60
    elseif spellName == "Foe Lullaby" or spellName == "Horde Lullaby" then 
        base = 30
    end

    bonus = 0
    if spellMap == "Lullaby" then
        bonus = bonus + player.job_points.brd.lullaby_duration
    end
    if buffactive['Clarion Call'] then
        bonus = bonus + (player.job_points.brd.clarion_call_effect * 2)
    end
    if buffactive['Tenuto'] and not spellMap == "Lullaby" then
        bonus = bonus + player.job_points.brd.tenuto_effect
    end


    if buffactive.Troubadour then
        mult = mult*2
        bonus = bonus*2
    end

    --Troub doesn't apply to marcato bonus. Marcato doesn't take effect if SV active
    if buffactive['Marcato'] and not buffactive['Soul Voice'] then
        bonus = bonus + player.job_points.brd.marcato_effect
    end

    local totalDuration = math.floor(mult*base + bonus)

    --send_command('echo '..mult..' '..base..' '..bonus..' '..totalDuration)
    --send_command('wait '..totalDuration..'; input /echo '..spellName..' off')

    return totalDuration
end

function job_buff_change(buff,gain)
    if buff == 'Commitment' then
        if gain then
            send_command('sw reset; sw start')
        end
    end
end

-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 18)
end


windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)